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
            Option "Enable" "true"
        '';
        deviceSection = ''
            Option "MetaModes" "1920x1200"
            Option "ConnectedMonitor" "HDMI-A-1"
            Option "ModeValidation" "NoDFPNativeResolutionCheck,NoVirtualSizeCheck,NoMaxPClkCheck,NoHorizSyncCheck,NoVertRefreshCheck,NoWidthAlignmentCheck"
        '';
        screenSection = ''
            DefaultDepth 24
            Option "TwinView" "True"
            SubSection "Display"
            Modes "1920x1200"
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
