{ inputs, config, lib, pkgs, ... }:

{
    services.tlp = {
        enable = true;
        settings = {
            CPU_SCALING_ON_AC = "performance";
            CPU_SCALING_ON_BAT = "performance";

            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        };
    };
}
