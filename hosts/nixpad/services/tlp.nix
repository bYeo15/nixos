{ inputs, config, lib, pkgs, ... }:

{
    services.tlp = {
        enable = true;
        settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "performance";

            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

            START_CHARGE_THRESH_BAT0 = 75;
            STOP_CHARGE_THRESH_BAT0 = 80;
        };
    };
}
