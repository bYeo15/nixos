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
        enable = false;
    };
}
