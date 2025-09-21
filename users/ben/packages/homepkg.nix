{ inputs, config, lib, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        playerctl

        # --[ Terminal Utilities ]--
        glow
        libsixel

        # --[ Authorship ]--
        libreoffice-fresh
        krita
        inkscape
        libresprite

        discord

        adwaita-icon-theme
        adwaita-icon-theme-legacy

        texliveFull

        # --[ Sway Tools ]--
        swayidle
        swaylock
        waybar
        wl-clipboard
        cliphist
        grim
        slurp
        glpaper
    ];

    # --[ Programs ]--
    programs = {
        zathura.enable = true;
        freetube.enable = true;

        direnv = {
            enable = true;
            config = {
                global.hide_env_diff = true;
            };
        };
    };

    # --[ Services ]--
    services = {
        mpris-proxy.enable = true;
    };
}
