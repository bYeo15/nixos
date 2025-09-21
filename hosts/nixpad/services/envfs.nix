{ inputs, config, lib, pkgs, ... }:

{
    services.envfs = {
        enable = true;
    };
}
