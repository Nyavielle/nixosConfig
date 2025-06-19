{
  description = "NixOS config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... } @inputs:
  let
    hosts = [
      {
        user = "Nyavielle";
        hostname = "Latitude-E5570";
        timezone = "Europe/Kyiv";
        system = "x86_64-linux";
        stateVersion = "25.05";
      }
    ];

    makeSystem = { hostname, user, timezone, system, stateVersion }: nixpkgs.lib.nixosSystem
    {
      system = system;
      
      specialArgs = {
        inherit inputs hostname user timezone system stateVersion;
      };
      
      modules = [
        ./hosts/${hostname}/settings

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user} = ./hosts/${hostname}/home-manager/home.nix;
            extraSpecialArgs = {
              inherit inputs hostname user timezone stateVersion;
            };
          };
        }
      ];
    };
  in
  {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
    configs // {
      "${host.hostname}" = makeSystem {
        inherit (host) hostname user timezone system stateVersion;
      };
    }) {} hosts;
  };
}
