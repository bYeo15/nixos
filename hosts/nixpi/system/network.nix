{ inputs, config, lib, pkgs, utilities, ... }:

{
    time.timeZone = "Australia/Sydney";

    age.secrets.netSecrets = {
        file = config.ageSecrets.secretFiles."netSecrets";
    };

    networking = {
        hostName = "nixpi";

        firewall = {
            enable = true;
            trustedInterfaces = [ "end0" ];
        };

        nftables = {
            enable = true;
            ruleset = ''
                table ip nat {
                    chain POSTROUTING {
                        type nat hook postrouting priority 100;
                        oifname "wlan0" counter masquerade
                    }
                }
                table ip filter {
                    chain INPUT {
                        iifname "end0" counter accept
                    }
                }
            '';
        };

        resolvconf.enable = false;

        useDHCP = lib.mkDefault true;
    };

    networking.networkmanager = {
        enable = true;

        ensureProfiles.environmentFiles = [ config.age.secrets.netSecrets.path ];

        insertNameservers = [ "1.1.1.1" "1.0.0.1" ];

        plugins = lib.mkForce [ ];

        wifi.powersave = false;

        ensureProfiles.profiles = lib.mergeAttrsList [
            (utilities.filterTagged "profile" [ "home5g" ] config.netconn.connections)

            # Static ethernet as subnet DHCP manager
            {
                piEth = {
                    connection = {
                        id = "piEth";
                        type = "ethernet";
                    };
                    ipv4 = {
                        method = "manual";
                        addresses = "10.0.0.1";
                    };
                    ipv6 = {
                        addr-gen-mode = "stable-privacy";
                        method = "auto";
                    };
                };
            }
        ];
    };
}
