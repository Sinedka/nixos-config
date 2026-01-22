{ pkgs, inputs, ... }:
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
  programs.nix-ld.enable = true;

  services.flatpak.enable = true;

}
