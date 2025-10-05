{ inputs, config, lib, pkgs, ... }:

let
    gamescopeLauncher = pkgs.writeShellScriptBin "gamescopeLauncher" ''
        ${lib.getExe pkgs.gamescope} -f --steam \
        --backend=headless \
        -- steam -pipewire -pipewire-dmabuf -tenfoot
    '';
    # ^ TODO: Test steamos3 steamdeck opts, and gamescope adaptive sync/immediate flips
in {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix
        htop

        git
        curl
        wget

        gamescopeLauncher

        wayvnc

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
