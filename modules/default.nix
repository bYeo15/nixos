{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./bluedev.nix
        ./netconn.nix
        ./renix.nix
    ];
}
