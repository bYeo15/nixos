{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./age.nix
        ./network.nix
    ];
}
