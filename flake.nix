{
  description = "NixOS configuration with Hyprland";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    serpantinum = {
      url = "github:ilyamiro/serpantinum";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/v0.55.4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aniparser.url = "github:sinedka/aniparser-flake";
    aniparser.inputs.nixpkgs.follows = "nixpkgs";

    caelestia-shell = {
      url = "github:caelestia-dots/shell/v2.2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-cli = {
      url = "github:caelestia-dots/cli/v1.1.1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.caelestia-shell.follows = "caelestia-shell";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable"; # IMPORTANT
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
      aniparser = inputs.aniparser.packages.${system}.default;
      caelestia-cli = inputs.caelestia-cli.packages.${system}.with-shell;
      user = "sinedka";
      hostnames = [
        "laptop"
        "desktop"
      ];
      stateVersion = "26.05";
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs hostnames (
        hostname:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit
              inputs
              stateVersion
              hostname
              user
              stable
              ;
          };

          modules = [
            ./hosts
            inputs.chaotic.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user}.imports = [
                ./home-manager/home.nix
                inputs.zen-browser.homeModules.twilight
                inputs.serpantinum.homeManagerModules.default
              ];

              # home-manager.users.${user} = ./home-manager/home.nix;
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  stateVersion
                  user
                  stable
                  aniparser
                  caelestia-cli
                  ;
              };
            }
          ];
        }
      );
    };
}
