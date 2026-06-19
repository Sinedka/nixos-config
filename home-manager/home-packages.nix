{
  pkgs,
  unstable,
  aniparser,
  caelestia-cli,
  ...
}:
{
  fonts.fontconfig.enable = true;

  home.packages =
    (with pkgs; [
      android-studio
      git-lfs
      unzip
      wl-clipboard
      wget
      git
      kitty
      telegram-desktop
      pavucontrol
      hyprpicker
      spotify
      # mpv
      qbittorrent
      cmake
      nerd-fonts.fira-code
      codex
      (pkgs.python3.withPackages (ps: with ps; [
        tkinter
        litemapy
        scikit-learn
      ]))
      zenity
      libreoffice
      gparted
      ntfs3g
      prismlauncher
      jdk21
      jetbrains.idea
    ])
    ++ ([
      aniparser
      caelestia-cli
    ]);

}
