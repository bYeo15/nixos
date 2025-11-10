{ inputs, config, lib, pkgs, ... }:

{
    options.devshells = with lib; with types; {
        devshells = mkOption {
            type = attrsOf (path);
            description = "A set of available devshells";
            default = { };
        };
    };
}
