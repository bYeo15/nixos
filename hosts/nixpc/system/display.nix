{ inputs, config, lib, pkgs, ... }:

{
    hardware.graphics = {
        enable = true;
    };

    hardware.nvidia = {
        open = false;
        modesetting.enable = true;
    };

    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" ];
    };

    services.displayManager = {
        enable = true;

        defaultSession = "gamescope";

        autoLogin = {
            enable = true;
            user = "gaming";
        };
    };
}
