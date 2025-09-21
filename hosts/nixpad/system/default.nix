{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./bluetooth.nix
        ./boot.nix
        ./display.nix
        ./network.nix
        ./nixFeatures.nix
        ./security.nix
        ./virtualisation.nix
    ];
}
