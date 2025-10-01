{ pkgs, unstable, aniparser, caelestia-cli, ... }: 
{
  fonts.fontconfig.enable = true;

  home.packages = (with pkgs; [
    unzip
    wl-clipboard
    wget
    git
    # upower
    # brightnessctl 
    # playerctl
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

    # fonts
    material-symbols
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    rubik
    grim
  ]) ++ ([
    aniparser
    (pkgs.callPackage ./screen-rec.nix {})
    caelestia-cli
  ]);

}
