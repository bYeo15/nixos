{ inputs, config, lib, pkgs, ... }:

{
    config.devshells = {
        pins = ./npins;
        devshells = {
            default = ./emptyShell.nix;
            python = ./pythonShell.nix;
            c = ./cShell.nix;
        };
        devshellLink = ".devshells";
    };
}
