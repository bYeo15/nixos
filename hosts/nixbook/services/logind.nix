{ inputs, config, lib, pkgs, ... }:

{
    services.logind.settings.Login = {
        HandleLidSwitch = "ignore";
        HandleLidSwitchExternalPower = "ignore";
        HandleLidSwitchDocked = "ignore";
    };
}
