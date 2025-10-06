{ inputs, config, lib, pkgs, ... }:

{
    users.users."gaming" = {
        isNormalUser = true;

        shell = pkgs.bash;

        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAuhigSbK+Ftd99A4OWm8L2bT4wbxbe01zcW9lkxUVYw"
        ];
    };
}
