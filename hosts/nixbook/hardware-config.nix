{ inputs, config, lib, pkgs, modulesPath, ... }:

{
    imports = [
        (modulesPath + "/installer/scan/not-detected.nix" )
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
        device = "/dev/disk/by-label/NixOS-Root";
        fsType = "ext4";
    };

    fileSystems."/home" = {
        device = "/dev/disk/by-label/NixOS-Home";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-label/NixOS-Boot";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
    };

    swapDevices = [{
        device = "/dev/disk/by-label/NixOS-Swap";
    }];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
