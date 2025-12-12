{ inputs, config, lib, pkgs, ... }:

let
    # Shell script that launches sunshine and gamescope
    # should be run with `startx $(which gamescopeLauncher)`
    steamLauncher = pkgs.writeShellScriptBin "steamLauncher" ''
        xrandr -s 1920x1200

        xdotool search --onlyvisible --sync "Steam" windowsize 100% 100% windowmove 0 0 &

        sunshine &>~/sunlog &
        steam -tenfoot &>~/steamlog
    '';
in {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix
        htop

        git
        curl
        wget

        xdotool
        steamLauncher

        (retroarch.withCores (cores: with cores; [
            citra
            dolphin
            pcsx-rearmed
            pcsx2
        ]))

        retroarch-assets

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

                # Retroarch
                libglvnd
            ];
        };
    };
}
