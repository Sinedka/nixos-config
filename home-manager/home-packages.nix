{ pkgs, unstable, aniparser, caelestia-cli, ... }: 
{
  fonts.fontconfig.enable = true;

  home.packages = (with pkgs; [
    htop
    python3
    unzip
    nodejs
    wl-clipboard
    lua-language-server
    wget
    cmatrix
    git
    fastfetch
    papirus-icon-theme
    glib
    jq
    bc
    swww
    upower
    brightnessctl 
    cava
    playerctl
    kitty
    firefox
    gcc
    telegram-desktop
    ntfs3g
    nil
    wl-clipboard
    nix-prefetch
    openssl
    yad
    prismlauncher
    pavucontrol
    nftables
    hyprshot
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
    (import ./modules/nvim/codeforces-extractor.nix { pkgs = pkgs; })
    aniparser
    (pkgs.callPackage ./screen-rec.nix {})
    caelestia-cli
  ]);

}
