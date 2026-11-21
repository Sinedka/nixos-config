# NixOS: OpenVPN by default, selected IPv4 traffic via DIRECT.
# Assumes an existing network connection (NetworkManager or networkd),
# an OpenVPN client profile in /etc/openvpn/client.ovpn, and no other DNS stub.
{ config, lib, pkgs, ... }:

let
  directUid = 1999;  # Choose a free UID; check: getent passwd 1999

  # IPv4 addresses/subnets that must bypass the VPN.
  directIPs = [
    "1.1.1.1/32"   # Example; remove if not needed
    # "203.0.113.5/32"
    # "198.51.100.0/24"
  ];

  # Domains (including subdomains) that must bypass the VPN.
  # They are mapped to IP addresses by dnsmasq when DNS requests occur.
  directDomains = [
    "example.com"  # Example; replace with your domains
    # "github.com"
  ];

  # Nix string -> nftables literal; no trailing comma for empty lists.
  directIPElements = lib.concatStringsSep ", " directIPs;
  dnsmasqNftsets = map (domain:
    "/${domain}/4#ip#vpn_route#direct_domains"
  ) directDomains;

  ip = "${pkgs.iproute2}/bin/ip";
  awk = "${pkgs.gawk}/bin/awk";
in
{
  environment.systemPackages = with pkgs; [
    openvpn iproute2 nftables dnsmasq curl dnsutils
  ];

  # This example deliberately handles IPv4 only. Prevent IPv6 bypass.
  # Remove only after implementing equivalent IPv6 routing/firewall rules.
  networking.enableIPv6 = false;

  users.groups.vpn-direct = {};
  users.users.vpn-direct = {
    isSystemUser = true;
    uid = directUid;
    group = "vpn-direct";
  };

  services.openvpn.servers.main = {
    config = ''
      config /etc/openvpn/client.ovpn
      redirect-gateway def1
    '';
    autoStart = true;
    updateResolvConf = false; # dnsmasq controls DNS
  };

  networking.nftables.enable = true;
  networking.nftables.tables.vpn_route = {
    family = "ip";
    content = ''
      set direct_ips {
        type ipv4_addr
        flags interval
        elements = { ${directIPElements} }
      }

      set direct_domains {
        type ipv4_addr
        flags interval
      }

      chain direct_mark {
        type route hook output priority mangle; policy accept;
        meta skuid ${toString directUid} meta mark set 0x1
        ip daddr @direct_ips meta mark set 0x1
        ip daddr @direct_domains meta mark set 0x1
      }
    '';
  };

  # Prevent NetworkManager from replacing /etc/resolv.conf.
  # If using systemd-networkd, it should also not override local DNS.
  networking.networkmanager.dns = lib.mkIf config.networking.networkmanager.enable "none";
  services.resolved.enable = lib.mkForce false;

  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true; # populate resolv.conf with 127.0.0.1
    settings = {
      no-resolv = true;
      server = [ "9.9.9.9" "149.112.112.112" ];
      listen-address = "127.0.0.1";
      bind-interfaces = true;
      domain-needed = true;
      bogus-priv = true;
      nftset = dnsmasqNftsets;
    };
  };

  systemd.services.dnsmasq = {
    after = [ "nftables.service" ];
    requires = [ "nftables.service" ];
  };

  # Main table: OpenVPN installs 0.0.0.0/1 + 128.0.0.0/1.
  # It retains the physical "default" route; copy that route into
  # table 100 so traffic marked 0x1 uses the real network.
  systemd.services.vpn-direct-route = {
    description = "Refresh physical IPv4 default route for VPN DIRECT traffic";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      route="$(${ip} -4 route show default | ${awk} '$1 == "default" && $0 !~ / dev tun/ { print; exit }')"
      if [ -n "$route" ]; then
        # Intentional splitting: ip route wants one argument per route token.
        ${ip} -4 route replace table 100 $route
      else
        ${ip} -4 route flush table 100
      fi

      if ! ${ip} -4 rule show | grep -q '100:.*fwmark 0x1.*lookup 100'; then
        ${ip} -4 rule del pref 100 2>/dev/null || true
        ${ip} -4 rule add pref 100 fwmark 0x1/0x1 lookup 100
      fi
    '';
    path = [ pkgs.gnugrep ];
  };

  # Refresh gateway after switching Wi-Fi / Ethernet / DHCP updates.
  systemd.timers.vpn-direct-route = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5s";
      OnUnitActiveSec = "15s";
      Unit = "vpn-direct-route.service";
    };
  };
}
