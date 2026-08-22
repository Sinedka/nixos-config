{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ddcutil
  ];

  hardware.i2c.enable = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="i2c-dev", KERNEL=="i2c-[0-9]*", ATTRS{class}=="0x030000", TAG+="uaccess"
    SUBSYSTEM=="dri", KERNEL=="card[0-9]*", TAG+="uaccess"
  '';

  boot.kernelModules = [ "i2c-dev" ];
}
