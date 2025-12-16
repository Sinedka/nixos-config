{ pkgs, unstable, aniparser, caelestia-cli, ... }: 
{
  fonts.fontconfig.enable = true;

  home.packages = (with pkgs; [
    unzip
    wl-clipboard
    wget
    git
    kitty
    telegram-desktop
    pavucontrol
    hyprpicker
    # slurp
    spotify
    quickgui
    mpv
    calibre
    zoom-us
    xfce.thunar
    qbittorrent
    cmake
    nix-tree
    nerd-fonts.fira-code
    clang
    gpu-screen-recorder
    python3
  ]) ++ ([
    aniparser
    caelestia-cli
  ]);

}
