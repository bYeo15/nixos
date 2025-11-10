{ inputs, config, lib, pkgs, ... }:

{
    config.devshells = {
        devshells = {
            default = ./emptyShell.nix;
            python = ./pythonShell.nix;
            c = ./cShell.nix;
        };
    };
}
