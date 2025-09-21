{ inputs, config, lib, pkgs, ... }:

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.consoleLogLevel = 0;
    boot.extraModprobeConfig = ''
        options thinkpad_acpi fan_control=1
    '';
    boot.kernelParams = [
        "quiet"
        "udev.log_level=3"
    ];
    boot.initrd.verbose = false;
}
