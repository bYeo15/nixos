{ inputs, config, lib, pkgs, ... }:

let
    # Shell script that launches sunshine and gamescope
    # should be run with `startx $(which gamescopeLauncher)`
    gamescopeLauncher = pkgs.writeShellScriptBin "gamescopeLauncher" ''
        sunshine &>~/sunlog &

        steam -pipewire -pipewire-dmabuf -tenfoot &>~/gamelog
    '';
    #${lib.getExe pkgs.gamescope} -f --steam \
    #-W 1920 -H 1200 \
in {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix
        htop

        git
        curl
        wget

        gamescopeLauncher

        inputs.agenix.packages."${system}".default
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
        remotePlay.openFirewall = true;
        gamescopeSession.enable = true;
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
