{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./age.nix
        ./boot.nix
        ./network.nix
        ./nixFeatures.nix
        ./virtualisation.nix
    ];
}
