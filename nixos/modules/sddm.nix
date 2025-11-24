{ config, pkgs, ... }:
let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
    #themeConfig = {
    #  Background = "path/to/background.jpg";
    #  Font = "M+1 Nerd Font";
    #};
  };
in {
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    wayland.enable = true;
    enable = true;
    package = pkgs.kdePackages.sddm; # qt6 sddm version
    extraPackages = with pkgs; [ custom-sddm-astronaut ];

    # theme = "sddm-astronaut-theme";
    # settings = {
    #   Theme = {
    #     Current = "sddm-astronaut-theme";
    #   };
    # };
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
  ];
}
