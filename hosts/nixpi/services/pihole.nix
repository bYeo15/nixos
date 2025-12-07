{ inputs, config, pkgs, lib, ... }:

{
    services.pihole-ftl = {
        enable = true;

        settings = {
            dns = {
                upstreams = [ "1.1.1.1" "1.0.0.1" ];
            };
            dhcp = {
                active = false;
            };
        };

        privacyLevel = 3;
    };
}
