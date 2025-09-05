{
  description = "Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };

    zen-browser = { url = "github:SoumyabrataBanik/flake-zen-browser"; inputs.nixpkgs.follows = "nixpkgs"; };

    codedisaster.url = "github:MatthewCroughan/codedisaster";
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-stable,
    home-manager, 
    codedisaster,
    zen-browser,
    ... 
    } @ inputs:
    let
      inherit (self) outputs;

      mkNixosConfiguration = hostname: username:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs hostname username;
            nixosModules = "${self}/modules";
            nixosPkgs = "${self}/pkgs";
          };
         
          modules = [

            ./hosts/${hostname} # import de la configuration pour cet hostname

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                backupFileExtension = "back";
                useGlobalPkgs = true;
                useUserPackages = true;
                verbose = true;
                users.${username} = ./home/${hostname};
                extraSpecialArgs = {inherit username inputs; };
              };
            }

            ({ pkgs, ...}: {
              nixpkgs.overlays = import "${self}/overlays/default.nix" inputs;
            })
          ];
        };
    in
    {
      nixosConfigurations = {
        "bulldog" = mkNixosConfiguration "bulldog" "Samuel";
      };
    };
  
  nixConfig = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];

    require-sigs = true;    
    fallback = true;      
  };
}
