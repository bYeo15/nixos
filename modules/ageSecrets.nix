{ inputs, config, lib, pkgs, ... }:

{
    options.ageSecrets = with lib; with types; {
        secretFiles = mkOption {
            type = attrsOf (path);
            description = "A set of named paths to secrets";
            default = { };
        };
    };
}
