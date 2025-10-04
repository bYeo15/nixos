{ inputs, config, lib, pkgs, ... }:

let
    gamescopeLauncher = pkgs.writeShellScriptBin "gamescopeLauncher" ''
        if [[ ''$(cat /sys/class/drm/card0/card0-HDMI-A-1/status) = "connected" ]]; then
            ${lib.getExe pkgs.gamescope} -W 1920 -H 1200 -f -e \
            -- steam -pipewire -pipewire-dmabuf -tenfoot
        else
            ${lib.getExe pkgs.gamescope} -W 1920 -H 1200 -f -e \
            --backend=headless -- steam -pipewire -pipewire-dmabuf -tenfoot
        fi
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
