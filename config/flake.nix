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
    setups = [
      {
        user = "Nyavielle";
        setupname = "NixOS";
        timezone = "Europe/Kyiv";
        system = "x86_64-linux";
        stateVersion = "25.05";
      }
    ];

    makeSetup = { setupname, user, timezone, system, stateVersion }: nixpkgs.lib.nixosSystem
    {
      system = system;
      
      specialArgs = {
        inherit inputs setupname user timezone system stateVersion;
      };
      
      modules = [
        ./setups/${setupname}/settings

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user} = ./setups/${setupname}/home-manager/home.nix;
            extraSpecialArgs = {
              inherit inputs setupname user timezone stateVersion;
            };
          };
        }
      ];
    };
  in
  {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: setup:
    configs // {
      "${setup.setupname}" = makeSetup {
        inherit (setup) setupname user timezone system stateVersion;
      };
    }) {} setups;
  };
}
