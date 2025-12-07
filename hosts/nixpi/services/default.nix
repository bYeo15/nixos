{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./dnsmasq.nix
        ./openssh.nix
        # Omitted until 25.11 release for rpi5
        #./pihole.nix
    ];
}
