{ inputs, config, lib, pkgs, modulesPath, nixos-raspberrypi, ... }:

{
    imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        nixos-raspberrypi.nixosModules.raspberry-pi-5.base
        #nixos-raspberrypi.nixosModules.raspberry-pi-5.page-size-16k
        nixos-raspberrypi.nixosModules.raspberry-pi-5.display-vc4
        nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
    ];

    boot.initrd.availableKernelModules = [ "usb_storage" "usbhid" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
        device = "/dev/disk/by-label/NixOS-Root";
        fsType = "ext4";
    };

    fileSystems."/boot/firmware" = {
        device = "/dev/disk/by-label/NixOS-Boot";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
    };

    swapDevices = [{
        device = "/dev/disk/by-label/NixOS-Swap";
    }];

    nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
