{ inputs, config, lib, pkgs, ... }:

let
    # Shell script that launches sunshine and gamescope
    # should be run with `startx $(which gamescopeLauncher)`
    gamescopeLauncher = pkgs.writeShellScriptBin "gamescopeLauncher" ''
        sunshine &>~/sunlog &

        steam-gamescope &>~/gamelog
    '';
in {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix
        htop

        git
        curl
        wget

        gamescopeLauncher

        retroarch

        inputs.agenix.packages."${stdenv.hostPlatform.system}".default
    ];

    programs.gamemode = {
        enable = true;
    };

    programs.gamescope = {
        enable = true;
        capSysNice = true;
    };

    programs.steam = {
        enable = true;
        gamescopeSession = {
            enable = true;
            args = [
                "--steam"
                "-W 1920"
                "-H 1200"
                "-r 60"
                "-f"
            ];
            steamArgs = [
                "-tenfoot"
            ];
        };
        package = pkgs.steam.override {
            extraPkgs = pkgs': with pkgs'; [
                xorg.libXcursor
                xorg.libXi
                xorg.libXinerama
                xorg.libXScrnSaver
                libpng
                libpulseaudio
                libvorbis
                stdenv.cc.cc.lib
                libkrb5
                keyutils
            ];
        };
    };
}
