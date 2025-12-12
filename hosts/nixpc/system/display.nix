{ inputs, config, lib, pkgs, ... }:

{
    hardware.graphics = {
        enable = true;
    };

    hardware.nvidia = {
        open = true;
        modesetting.enable = true;
    };

    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" ];
        displayManager.startx.enable = true;
        monitorSection = ''
            Modeline "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
            Option "PreferredMode" "1920x1200_60.00"
        '';
        deviceSection = ''
            Option "ConnectedMonitor" "HDMI-0"
            Option "ModeValidation" "NoDFPNativeResolutionCheck,NoVirtualSizeCheck,NoMaxPClkCheck,NoHorizSyncCheck,NoVertRefreshCheck,NoWidthAlignmentCheck"
        '';
        screenSection = ''
            SubSection "Display"
                Virtual 1920 1200
            EndSubSection
        '';
    };

    services.sunshine = {
        enable = true;
        capSysAdmin = true;
        openFirewall = true;
        autoStart = true;
        package = pkgs.sunshine.override { cudaSupport = true; };
    };
}
