{
  pkgs,
  inputs,
  options,
  ...
}:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./ddcutil.nix
    ./electron.nix
    ./env.nix
    ./gc.nix
    ./home-manager.nix
    ./hyprland.nix
    ./nekoray.nix
    ./vaapi.nix
    ./net.nix
    ./nh.nix
    ./nix.nix
    ./sddm.nix
    ./timezone.nix
    ./upower.nix
    ./user.nix
    ./systemd.nix
    ./graphics.nix
    ./thunar.nix
    ./polkit.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;
  programs.steam = {
    enable = true;
  };
  programs.gpu-screen-recorder.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries =
      options.programs.nix-ld.libraries.default
      ++ (with pkgs; [
        glib # libglib-2.0.so.0, libgthread-2.0.so.0
        nspr
        dbus
        nss
        at-spi2-core
        cups
        cairo
        gtk3
        pango
        xorg.libX11
        xorg.libXcomposite
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXrandr
        mesa
        expat
        libgbm
        xorg.libxcb
        libxkbcommon
        alsa-lib
      ]);
  };

  services.flatpak.enable = true;

}
