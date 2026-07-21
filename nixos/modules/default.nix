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
    ./happ.nix
  ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;

  programs.gpu-screen-recorder.enable = true;

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
    usbmon.enable = true;
    dumpcap.enable = true;
  };

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
        libX11
        libXcomposite
        libXdamage
        libXext
        libXfixes
        libXrandr
        mesa
        expat
        libgbm
        xorg.libxcb
        libxkbcommon
        alsa-lib
        stdenv.cc.cc
        icu
        libgdiplus
        pcre
        libglvnd
        libGL
        xorg.libXext 
        xorg.libXdamage 
        xorg.libXfixes
        krb5
        brotli
        fontconfig
        freetype
      ]);
  };

  networking.firewall.allowedTCPPorts = [ 25565 ];
  networking.firewall.allowedUDPPorts = [ 25565 ];
}
