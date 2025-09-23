{ inputs, config, lib, pkgs, ... }:

{
    services.tlp = {
        enable = true;
        settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "powersave";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        };
    };
}
