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
        deviceSection = ''
            Option "ConnectedMonitor" "HDMI-A-1"
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
    };
}
