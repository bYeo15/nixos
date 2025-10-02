{ inputs, config, lib, pkgs, ... }:

{
    virtualisation = {
        containers.enable = true;
        podman = {
            enable = true;
            defaultNetwork.settings = {
                dns_enabled = true;
            };
        };
    };
}
