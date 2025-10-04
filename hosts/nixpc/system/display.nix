{ inputs, config, lib, pkgs, ... }:

{
    hardware.graphics = {
        enable = true;
    };

    hardware.nvidia = {
        open = false;
        modesetting.enable = true;
    };

    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" ];
    };

    services.displayManager = {
        enable = true;

        session = [
            {
                manage = "window";
                name = "gamescope";
                start = ''
                    ${lib.getExe pkgs.gamescope} -- ${lib.getExe pkgs.steam} &
                    waitPID=''$!
                '';
            }
        ];

        defaultSession = "gamescope";

        autoLogin = {
            enable = true;
            user = "gaming";
        };
    };
}
