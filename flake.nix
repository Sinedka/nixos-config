{
  description = "NixOS configuration with Hyprland";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
      user = "sinedka";
      hostname = "nixosuser";
      stateVersion = "25.05";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs stateVersion hostname user unstable; };

        modules = [
          ./hosts/${hostname}/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = ./home-manager/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs stateVersion user unstable; };
          }
        ];
      };
    };
}
