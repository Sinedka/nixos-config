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
    prismlauncher
    pavucontrol
    brave
    nautilus
    hyprpicker
    wf-recorder
    slurp
    quickemu
    spotify
    quickgui
    qmk
    qmk-udev-rules # the only relevant
    qmk_hid
    via
    vial
    mpv
    glslls
    calibre
    zoom-us
    os-prober
    xfce.thunar
    code-cursor
    wpsoffice-cn
    hydralauncher
    qbittorrent
    cmake

    # fonts
    material-symbols
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    rubik
    grim
    mupen64plus
  ]) ++ ([
    aniparser
    caelestia-cli
  ]);

}
