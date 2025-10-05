{ inputs, config, lib, pkgs, ... }:

let
    gamescopeLauncher = pkgs.writeShellScriptBin "gamescopeLauncher" ''
        export SDL_VIDEO_DRIVER_MINIMIZE_ON_FOCUS_LOSS=0
        ${lib.getExe pkgs.gamescope} --steam \
        -- steam -pipewire -pipewire-dmabuf -tenfoot
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
