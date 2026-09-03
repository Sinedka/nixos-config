{ stateVersion, user, ... }:
{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = user;
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;
}
