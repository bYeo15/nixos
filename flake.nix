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


    outputs = { self, nixpkgs, home-manager, hardware, agenix, nur, ...}@inputs:
        let
            utils = import ./utils { lib = nixpkgs.lib };
            base_modules = [
                { _module.args = { inherit utils; }; }
                ./modules
                agenix.nixosModules.default
                nur.modules.nixos.default
            ];
        in {
            nixosConfigurations = {
                # ---[ Primary Laptop ]---
                nixpad = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; };

                    modules = [
                        ./hosts/nixpad
                    ] ++ base_modules;
                };
            };

            homeConfigurations = {
                # ---[ Main User ]---
                "ben" = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;

                    extraSpecialArgs = { inherit inputs; };

                    modules = [
                        ./users/ben
                    ] ++ base_modules;
                };
            };
        };
}
