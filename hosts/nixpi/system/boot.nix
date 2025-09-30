{ inputs, config, lib, pkgs, ... }:

{
    boot.kernel.sysctl = {
        "net.ipv4.conf.default.forwarding" = 1;
    };
}
