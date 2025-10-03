{ inputs, config, lib, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix
        htop

        git
        curl
        wget

        inputs.agenix.packages."${system}".default
    ];

    programs.gamemode = {
        enable = true;
    };

    programs.gamescope = {
        enable = true;
    };

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        gamescopeSession.enable = true;
    };
}
