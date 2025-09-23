{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./hardware-config.nix
        ./users.nix
        ./packages
        ./services
        ./system
    ];

    system.stateVersion = "25.05";
}
