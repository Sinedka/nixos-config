{ homeStateVersion, user, ... }:
{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/sinedka";
    stateVersion = homeStateVersion;
  };

  programs.home-manager.enable = true;
}
