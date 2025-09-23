{ inputs, config, lib, pkgs, ... }:

{
    # Admin user for managing node
    users.users."admin" = {
        isNormalUser = true;

        extraGroups = [
            "wheel"
        ];

        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcPlbKYcdnvWBeU869BVUrZU7C7+/gH2vCqlKdxl3SY"
        ];

        shell = pkgs.bash;
    };

    # Unprivileged node user for running podman containers
    users.users."node" = {
        isNormalUser = true;

        extraGroups = [
            # TODO : Podman
        ];

        shell = pkgs.bash;
    };
}
