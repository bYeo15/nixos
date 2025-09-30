{
    description = "NixOS + HomeManager Configuration";

    inputs = {
        # Local submodule, exposed as a file to ensure
        # git access isn't always required (ie. systems/users
        # can be build WITHOUT access to private staging)
        secrets = {
            url = "git+file:./secrets";
            flake = false;
        };

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

		    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    };


    nixConfig = {
        extra-substituters = [
            "https://nixos-raspberrypi.cachix.org"
        ];
        extra-trusted-public-keys = [
            "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
        ];
    };


    outputs = { self, secrets, nixpkgs, home-manager, hardware, agenix, nur, nixos-raspberrypi, ... }@inputs:
        let
            # Load library of personal utils
            utils = import ./utils { lib = nixpkgs.lib; };
            base_modules = [
                # Ensure modules can access utilities (note that "utils" results in a collision
                # with some NetworkManager module lol)
                { _module.args = { utilities = utils; }; }

                # Universal modules and secrets
                ./modules
                ./resources
                "${secrets}"        # String interpolation resolves input -> store path...
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

                # ---[ Node Laptop ]---
                "nixbook" = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; };

                    modules = [
                        ./hosts/modules
                        ./hosts/nixbook

                        ./users/admin.nix
                        ./users/node.nix
                    ] ++ base_modules ++ nixos_modules;
                };

                # ---[ Pi Node ]---
                "nixpi" = nixos-raspberrypi.lib.nixosSystemFull {
                    specialArgs = { inherit inputs; inherit nixos-raspberrypi; };

                    modules = [
                        ./hosts/modules
                        ./hosts/nixpi

                        ./users/admin.nix
                        ./users/staging.nix
                    ] ++ base_modules ++ nixos_modules;
                };

                # ---[ Gaming PC ]---
                # TODO
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

                # ---[ Gaming User ]---
                # TODO
            };
        };
}
