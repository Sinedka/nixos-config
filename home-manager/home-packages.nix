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
      # wpsoffice-cn
      # chromium
      osu-lazer-bin
      nodejs
      # code-cursor
      android-studio
      vscode
      # azahar
      codex
      modrinth-app
      (pkgs.python3.withPackages (ps: with ps; [
        tkinter
        litemapy
        scikit-learn
      ]))

    ])
    ++ ([
      aniparser
      caelestia-cli
    ]);

}
