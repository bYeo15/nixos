{ inputs, config, lib, pkgs, ... }:

{
    boot.loader.raspberryPi.bootloader = "kernel";

    boot.kernel.sysctl = {
        "net.ipv4.conf.default.forwarding" = 1;
        "net.ipv4.conf.all.forwarding" = 1;
        "net.ipv4.ip_forward" = 1;
    };

    boot.extraModprobeConfig = ''
        options brcmfmac feature_disable=0x282000
        options brcmfmac roamoff=1
    '';
}
