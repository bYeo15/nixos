# Home-Manager default.nix (hosts should use users/ben/user.nix directly)

{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./desktop
        ./packages
    ];

    home = {
        username = "ben";
        homeDirectory = "/home/ben";
        stateVersion = "22.11";
    };

    programs.home-manager.enable = true;
}
