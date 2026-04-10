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
      unzip
      wl-clipboard
      wget
      git
      kitty
      telegram-desktop
      pavucontrol
      hyprpicker
      spotify
      mpv
      zoom-us
      qbittorrent
      cmake
      nerd-fonts.fira-code
      clang
      osu-lazer-bin
      nodejs
      vscode
      codex
      (pkgs.python3.withPackages (ps: with ps; [
        tkinter
        litemapy
        scikit-learn
      ]))
      zenity
      xarchiver
      gparted
      quickshell
      rofi
    ])
    ++ ([
      aniparser
      # caelestia-cli
    ]);

}
