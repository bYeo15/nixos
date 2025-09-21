{
    description = "NixOS + HomeManager Configuration";

    inputs = {
        # Use git submodules
        self.submodules = true;

        nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

        home-manager = {
    		    url = "github:nix-community/home-manager";
    		    inputs.nixpkgs.follows = "nixpkgs";
    		};

    		hardware.url = "github:nixos/nixos-hardware";

    		agenix.url = "github:ryantm/agenix";

    		nur = {
    		    url = "github:nix-community/NUR";
    		    inputs.nixpkgs.follows = "nixpkgs";
    		};
    };


    outputs = { self, nixpkgs, home-manager, hardware, agenix, nur, ... }@inputs:
        let
            # Load library of personal utils
            utils = import ./utils { lib = nixpkgs.lib; };
            base_modules = [
                { _module.args = { utilities = utils; }; }

                # Universal modules and secrets
                ./modules
                ./secrets
                ./resources
            ];
            nixos_modules = [
                nur.modules.nixos.default
                agenix.nixosModules.default
            ];
            home_modules = [
                nur.modules.homeManager.default
                agenix.homeManagerModules.default
            ];
        in {
            nixosConfigurations = {
                # ---[ Primary Laptop ]---
                "nixpad" = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; };

                    modules = [
                        ./hosts/modules
                        ./hosts/nixpad

                        # Only user on this is main
                        ./users/ben/user.nix
                    ] ++ base_modules ++ nixos_modules;
                };
            };

            homeConfigurations = {
                # ---[ Main User ]---
                "ben" = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;

                    extraSpecialArgs = { inherit inputs; };

                    modules = [
                        ./users/modules
                        ./users/ben

                    ] ++ base_modules ++ home_modules;
                };
            };
        };
}
