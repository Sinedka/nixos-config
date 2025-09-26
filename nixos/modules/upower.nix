{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    upower
  ];

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
