{ inputs, config, lib, pkgs, ... }:

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.consoleLogLevel = 0;
    boot.kernelParams = [
        "quiet"
        "udev.log_level=1"
    ];
    boot.initrd.verbose = false;

}
