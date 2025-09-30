{ inputs, config, lib, pkgs, ... }:

{
    boot.kernel.sysctl = {
        "net.ipv4.conf.default.forwarding" = 1;
    };

    boot.extraModprobeConfig = ''
        options brcmfmac feature_disable=0x282000
        options brcmfmac roamoff=1
    '';
}
