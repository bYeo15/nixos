{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./hardware-config.nix
        ./packages
        ./services
        ./system
    ];

    system.stateVersion = "25.05";
}
