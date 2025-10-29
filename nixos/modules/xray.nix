{ config, pkgs, ... }:

{
  services.xray = {
    enable = true;
    # package = pkgs.xray; # уже есть в nixpkgs
    # configFile = "/etc/xray/config.json";
  };
}
