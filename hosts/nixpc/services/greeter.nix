{ inputs, config, lib, pkgs, ... }:

{
    services.getty.autologinUser = "gaming";

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = ''
                    ${lib.getExe pkgs.gamescope} -e -- \
                    steam -pipewire -pipewire-dmabuf -tenfoot
                '';
                user = "gaming";
            };
        };
    };
}
