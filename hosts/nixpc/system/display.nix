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

        defaultSession = "steam";

        autoLogin = {
            enable = true;
            user = "gaming";
        };
    };
}
