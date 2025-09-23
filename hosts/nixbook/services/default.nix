{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./envfs.nix
        ./logind.nix
        ./openssh.nix
        ./tlp.nix
        ./tuigreet.nix
    ];
}
