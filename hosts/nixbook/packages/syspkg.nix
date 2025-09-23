{ inputs, config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        helix

        htop

        nettools

        git
        curl
        wget
    ];

    programs.dconf.enable = true;
}
