{ inputs, config, lib, pkgs, ... }:

{
    services.dnsmasq = {
        enable = true;
        settings = {
            interface = "end0";
            # Disable DNS services
            port = 0;
            # 2-10 are reserved for static assignment
            dhcp-range = [ "10.0.0.10,10.0.0.254,255.255.255.0,6h" ];
            dhcp-host = config.netconn.dhcpMappings;
        };
    };
}
