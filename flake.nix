{
  description = "Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    codedisaster.url = "github:MatthewCroughan/codedisaster";
  };

  outputs = { self, nixpkgs, home-manager, codedisaster,... }@inputs:
    let
      inherit (self) outputs;

      mkNixosConfiguration = hostname: username:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs hostname username;
            nixosModules = "${self}/modules/nixos";
            nixosPkgs = "${self}/pkgs";
          };
         
          modules = [
            ./hosts/${hostname} # import de la configuration pour cet hostname
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                backupFileExtension = "back";
                useGlobalPkgs = false;
                useUserPackages = true;
                verbose = true;
                users.${username} = ./home/${hostname};

                extraSpecialArgs = {
                  inherit username;
                  nixosPkgs = "${self}/pkgs";
                  codedisaster = inputs.codedisaster;
                };
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        "bulldog" = mkNixosConfiguration "bulldog" "Samuel";
      };
    };
}
