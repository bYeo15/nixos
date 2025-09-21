{ inputs, config, lib, pkgs, ... }:

{
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    # Pipewire integration
    services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msvc" = true;
            "bluez5.enable-hw-volume" = true;
        };
    };
}
