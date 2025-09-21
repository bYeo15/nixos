{ inputs, config, lib, pkgs, ... }:

{
    services.greetd = {
        enable = true;
        settings = {
            default_session.command = ''
                ${pkgs.tuigreet}/bin/tuigreet \
                --time \
                --asterisks \
                --user-menu \
                --cmd ${pkgs.bash}/bin/bash
            '';
        };
    };

    environment.etc."greetd/environments".text = ''
        bash
        sway
    '';
}
