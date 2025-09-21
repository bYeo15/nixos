{ inputs, config, lib, pkgs, ... }:

{
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

    virtualisation.docker = {
        enable = true;
        rootless = {
            enable = true;
            setSocketVariable = true;
            daemon.settings = {
                userland-proxy = false;
            };
        };
    };

    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
}
