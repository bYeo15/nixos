{ inputs, config, lib, pkgs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nix.optimise = {
        automatic = true;
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-then 30d";
    };

    nix.settings = {
        trusted-users = [ "root" ];
    };
}
