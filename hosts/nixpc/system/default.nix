{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./age.nix
        ./boot.nix
        ./display.nix
        ./network.nix
        ./nixFeatures.nix
        ./security.nix
    ];
}
