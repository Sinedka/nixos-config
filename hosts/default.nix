{
  pkgs,
  stateVersion,
  hostname,
  ...
}:
let
  path = ./${hostname}/configuration.nix;
in
{
  imports = [
    ./${hostname}/hardware-configuration.nix
    ../nixos/modules
  ]
  ++ (if builtins.pathExists path then [ path ] else [ ]);

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
