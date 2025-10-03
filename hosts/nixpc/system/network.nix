{ inputs, config, lib, pkgs, ... }:

{
    time.timeZone = "Australia/Sydney";

    networking = {
        hostName = "nixpc";

        resolvconf.enable = false;

        useDHCP = lib.mkDefault true;
    };

    networking.networkmanager = {
        enable = true;

        ensureProfiles.profiles = {
            "pcEth" = {
                connection = {
                    id = "pcEth";
                    type = "ethernet";
                    autoconnect = true;
                };
                ipv4 = {
                    method = "auto";
                };
                "802-3-ethernet" = {
                    wake-on-lan = "magic";
                };
            };
        };
    };
}
