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
        };

        resolvconf.enable = false;

        useDHCP = lib.mkDefault true;
    };

    networking.networkmanager = {
        enable = true;

        ensureProfiles.environmentFiles = [ config.age.secrets.netSecrets.path ];

        insertNameservers = [ "1.1.1.1" "1.0.0.1" ];

        plugins = lib.mkForce [ ];

        ensureProfiles.profiles = utilities.filterTagged "profile" [ "home" ] config.netconn.connections;
    };
}
