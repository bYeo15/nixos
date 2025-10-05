{ inputs, config, lib, pkgs, ... }:

{
    hardware.graphics = {
        enable = true;
    };

    hardware.nvidia = {
        open = true;
        modesetting.enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
}
