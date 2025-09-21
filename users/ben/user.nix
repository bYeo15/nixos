{ inputs, config, lib, pkgs, ... }:

{
    users.users."ben" = {
        isNormalUser = true;

        extraGroups = [
            "wheel"
            "audio"
            "video"
            "light"
            "networkmanager"
            "libvirtd"
            "powermanagement"
            "docker"
        ];

        shell = pkgs.bash;
    };
}
