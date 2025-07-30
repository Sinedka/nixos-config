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
    ./net.nix
    ./nh.nix
    ./nix.nix
    ./timezone.nix
    ./upower.nix
    ./user.nix
  ];
nixpkgs.config.allowUnfree = true;
    programs.steam = {
    enable = true;
  };

}
