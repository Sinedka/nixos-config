{pkgs, ...}:
{
  imports = [
    ./binds.nix
    # ./colors.nix
    ./execs.nix
    ./general.nix
    # ./hypridle.nix
    ./rules.nix
    ./env.nix
  ];

  home.packages = [
    (pkgs.callPackage ./default.nix {})
  ];
}
