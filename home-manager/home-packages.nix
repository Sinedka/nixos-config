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
      calibre
      zoom-us
      qbittorrent
      cmake
      nerd-fonts.fira-code
      clang
      # gpu-screen-recorder
      python3
      wpsoffice-cn
      chromium
      osu-lazer-bin
      nodejs
      code-cursor
      android-studio
      vscode
      codex
    ])
    ++ ([
      aniparser
      caelestia-cli
    ]);

}
