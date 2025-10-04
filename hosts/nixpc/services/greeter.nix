{ inputs, config, lib, pkgs, ... }:

{
    services.getty.autologinUser = "gaming";

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = ''
                    ${lib.getExe pkgs.gamescope} -W 1920 -H 1080 \
                    -f -e --xwayland-count 2 --hdr-enabled \
                    --hdr-ltm-enabled -- \
                    steam -pipewire-dmabuf -gamepadui -steamdeck \
                    -steamos > /dev/null 2>&1
                '';
                user = "gaming";
            };
        };
    };
}
