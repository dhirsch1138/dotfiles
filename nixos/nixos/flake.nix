{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";  # Follows stable nixpkgs by default
    };
    #home-manager.url = "github:nix-community/home-manager";
    #home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      helios = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
        };
        modules = [
        ./hosts/helios/configuration.nix
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.david = ./users/david/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
     crow = nixpkgs.lib.nixosSystem {
       specialArgs = {
         inherit system;
       };
       modules = [
         ./hosts/crow/configuration.nix
         home-manager.nixosModules.home-manager
           {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.users.david = ./users/david/crow.nix;
           }
       ];
      };
    };
  };
}
