{pkgs, ...}:
{
  home.file.".config/hypr".source = ./hypr;
  home.file.".config/hypr".recursive = true;
  
  # deps
  home.packages = (with pkgs; [
    xdg-desktop-portal-gtk
    hyprpicker
    hypridle
    wl-clipboard
    cliphist
    bluez-tools
    bluez
    inotify-tools
    app2unit
    wireplumber
    trash-cli
    foot
    fish
    fastfetch
    starship
    btop
    jq
    socat
    imagemagick
    curl
    adw-gtk3
    papirus-icon-theme
    nerd-fonts.jetbrains-mono
  ]);

}
