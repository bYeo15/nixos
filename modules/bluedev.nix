{ inputs, config, lib, pkgs, ... }:

let
    device = with lib; with types; submodule {
        options = {
            name = {
                type = str;
                description = "Alias name for the device's MAC";
            };
            mac = mkOption {
                type = str;
                description = "MAC address of the given device";
            };
        };
    };
    taggedDev = with lib; with types; submodule {
        options = {
            tags = mkOption {
                type = listOf (str);
                description = "Tags for this device";
            };
            dev = mkOption {
                type = device;
                description = "The device";
            };
        };
    };

in {
    options.bluedev = with lib; with types; {
        devices = mkOption {
            type = attrsOf (taggedDev);
            description = "A set of available tagged bluetooth devices";
            default = { };
        };
    };
}
