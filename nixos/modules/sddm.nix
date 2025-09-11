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
    # extraPackages = with pkgs; [
    #   custom-sddm-astronaut
    #  ];

    theme = "sddm-sugar-dark";
    settings = {
      Theme = {
        Current = "sddm-sugar-dark";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    sddm-sugar-dark
    kdePackages.qtmultimedia
  ];

}
