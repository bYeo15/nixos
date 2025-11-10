{ inputs, config, lib, pkgs, ... }:

{
    options.devshells = with lib; with types; {
        devshells = mkOption {
            type = attrsOf (path);
            description = "A set of available devshells";
            default = { };
        };
        devshellLink = mkOption {
            type = str;
            description = "The path to link devshells into (relative to ~)";
            default = ".devshells";
        };
        pins = mkOption {
            type = path;
            description = "The npins directory to include with linked devshells";
        };
    };
}
