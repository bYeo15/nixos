{ inputs, config, lib, pkgs, ... }:

{
    users.users."node" = {
        isNormalUser = true;

        extraGroups = [
            # TODO : Podman
        ];

        shell = pkgs.bash;
    };
}
