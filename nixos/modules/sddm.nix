{ config, pkgs, ... }:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    package = pkgs.kdePackages.sddm;
    extraPackages = [ custom-sddm-astronaut ];

    theme = "sddm-astronaut-theme";

    settings = {
      Theme.Current = "sddm-astronaut-theme";
    };
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
  ];

  system.activationScripts.sddmWestonConfig.text = ''
    install -d -m755 /var/lib/sddm/.config

    cat > /var/lib/sddm/.config/weston.ini <<'EOF'
[core]

[output]
name=eDP-1
mode=preferred

[output]
name=HDMI-A-1
mode=preferred
same-as=eDP-1
EOF

    chown -R sddm:sddm /var/lib/sddm/.config
  '';
}
