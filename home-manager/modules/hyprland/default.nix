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

  home.file.".config/record.sh".source = ./record.sh;
}
