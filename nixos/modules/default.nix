{pkgs, ...}:
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
  ];
nixpkgs.config.allowUnfree = true;
    programs.steam = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
     via
  ];

  services.udev.packages = [ pkgs.via ];

  hardware.keyboard.qmk.enable = true;
  services.logmein-hamachi.enable = true;
}
