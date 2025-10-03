{ inputs, config, lib, pkgs, ... }:

{
    users.users."gaming" = {
        isNormalUser = true;

        shell = pkgs.bash;
    };
}
