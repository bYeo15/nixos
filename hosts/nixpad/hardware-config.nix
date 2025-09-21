{ inputs, config, lib, pkgs, modulesPath, ... }:

{
    imports = [
        (modulesPath + "/installer/scan/not-detected.nix" )
    ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ "dm-snapshot" "cryptd" ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
        device = "/dev/disk/by-label/NixOS-Root";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-label/NixOS-Boot";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
    };

    boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-label/NixOS-Enc";

    swapDevices = [{
         device = "/dev/disk/by-label/NixOS-Swap";
    }];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
