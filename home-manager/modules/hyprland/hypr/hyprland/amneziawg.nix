{ pkgs, lib, ... }:

let
  cfg = {
    interface = "awg0";
    configFile = "/etc/amnezia/awg0.conf";

    endpoint = "157.173.21.31";

    vpnTable = 200;
    directMark = "0x1";

    steamUid = 3200;

    ruListUrl =
      "https://raw.githubusercontent.com/"
      + "HappyFeedFriends/ru-ip-routes/"
      + "main/output/ru-combined-cidr.txt";
  };

  ip = "${pkgs.iproute2}/bin/ip";
  nft = "${pkgs.nftables}/bin/nft";
  curl = "${pkgs.curl}/bin/curl";
  resolvectl = "${pkgs.systemd}/bin/resolvectl";

  updateRu = pkgs.writeShellApplication {
    name = "awg-update-ru";

    runtimeInputs = with pkgs; [
      curl
      nftables
      coreutils
      gnugrep
      gawk
      python3
    ];

    text = ''
      set -euo pipefail

      tmp=$(mktemp -d)
      trap 'rm -rf "$tmp"' EXIT

      curl --fail --location \
        --retry 3 --max-time 90 \
        "${cfg.ruListUrl}" \
        -o "$tmp/source"

      python3 - "$tmp/source" "$tmp/list" <<'PY'
import ipaddress
import sys

networks = set()

with open(sys.argv[1]) as f:
    for line in f:
        line = line.strip()
        if not line or line.startswith("#"):
            continue

        try:
            network = ipaddress.ip_network(
                line, strict=False
            )
        except ValueError:
            continue

        if network.version == 4:
            networks.add(network)

if len(networks) < 100:
    raise SystemExit("RU list too small")

collapsed = ipaddress.collapse_addresses(networks)

with open(sys.argv[2], "w") as f:
    for network in collapsed:
        f.write(str(network) + "\n")
PY

      {
        echo "flush set ip awg_route ru_direct"
        printf "add element ip awg_route ru_direct { "
        paste -sd, "$tmp/list"
        echo " }"
      } > "$tmp/batch"

      nft -f "$tmp/batch"
    '';
  };

  policyUp = pkgs.writeShellScript "awg-policy-up" ''
    set -euo pipefail

    ${ip} -4 route replace \
      default dev ${cfg.interface} \
      table ${toString cfg.vpnTable}

    ${ip} -4 rule del priority 100 2>/dev/null || true
    ${ip} -4 rule del priority 110 2>/dev/null || true
    ${ip} -4 rule del priority 200 2>/dev/null || true

    # Прямой маршрут для VPN endpoint.
    ${ip} -4 rule add priority 100 \
      to ${cfg.endpoint}/32 lookup main

    # Помеченные пакеты напрямую.
    ${ip} -4 rule add priority 110 \
      fwmark ${cfg.directMark}/0x1 lookup main

    # Остальной IPv4-трафик через VPN.
    ${ip} -4 rule add priority 200 \
      lookup ${toString cfg.vpnTable}

    ${resolvectl} dns ${cfg.interface} 1.1.1.1
    ${resolvectl} domain ${cfg.interface} '~.'
    ${resolvectl} default-route ${cfg.interface} yes
  '';

  policyDown = pkgs.writeShellScript "awg-policy-down" ''
    ${ip} -4 rule del priority 200 2>/dev/null || true
    ${ip} -4 rule del priority 110 2>/dev/null || true
    ${ip} -4 rule del priority 100 2>/dev/null || true
    ${ip} -4 route flush table ${toString cfg.vpnTable}
    ${resolvectl} revert ${cfg.interface} || true
  '';

in
{
  networking = {
    networkmanager.enable = true;
    nftables.enable = true;
    enableIPv6 = false;

    wg-quick.interfaces.${cfg.interface} = {
      type = "amneziawg";
      autostart = true;
      configFile = cfg.configFile;
    };

    nftables.tables.awg_route = {
      family = "ip";

      content = ''
        set ru_direct {
          type ipv4_addr
          flags interval
          auto-merge
        }

        chain output {
          type route hook output priority mangle;
          policy accept;

          # Российские IPv4-адреса.
          ip daddr @ru_direct \
            meta mark set ${cfg.directMark}

          # Steam под выделенным UID.
          meta skuid ${toString cfg.steamUid} \
            meta mark set ${cfg.directMark}
        }
      '';
    };
  };

  boot.kernel.sysctl = {
    "net.ipv6.conf.all.disable_ipv6" = 1;
    "net.ipv6.conf.default.disable_ipv6" = 1;
  };

  services.resolved.enable = true;

  environment.systemPackages = with pkgs; [
    amneziawg-tools
    amneziawg-go
    iproute2
    nftables
    curl
    dnsutils
    updateRu
  ];

  programs.steam.enable = true;

  users.groups.steam-direct = {};

  users.users.steam-direct = {
    isNormalUser = true;
    uid = cfg.steamUid;
    group = "steam-direct";
    home = "/var/lib/steam-direct";
    createHome = true;
  };

  systemd.services.awg-policy = {
    description = "AmneziaWG policy routing";

    wantedBy = [ "multi-user.target" ];

    requires = [
      "wg-quick-${cfg.interface}.service"
    ];

    after = [
      "wg-quick-${cfg.interface}.service"
      "NetworkManager.service"
      "systemd-resolved.service"
    ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = policyUp;
      ExecStop = policyDown;
    };
  };

  systemd.services.awg-ru-update = {
    description = "Update Russian IPv4 routes";

    after = [ "nftables.service" ];
    requires = [ "nftables.service" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${updateRu}/bin/awg-update-ru";
    };
  };

  systemd.timers.awg-ru-update = {
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnBootSec = "2min";
      OnUnitActiveSec = "80h";
      Persistent = true;
    };
  };
}
