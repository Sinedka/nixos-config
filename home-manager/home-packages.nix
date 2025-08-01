{ pkgs, unstable, aniparser, ... }: 
{
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
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
    libsForQt5.qt5ct
    qt6ct
    xdg-desktop-portal-hyprland
    xdg-user-dirs
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
    electron
    openssl
    yad
    prismlauncher
    pavucontrol
    nftables

    # fonts
    material-symbols
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    rubik
    grim
    hyprshot
  ];

}
