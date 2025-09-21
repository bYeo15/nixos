{ inputs, config, lib, pkgs, ... }:

let
    connection = with lib; with types; submodule {
        options = {
            tags = mkOption {
                type = listOf (str);
                description = "Tags for this connection";
            };
            block = mkOption {
                type = attrs;
                description = "Profile fitting the format of `programs.ssh.matchBlocks`";
            };
        };
    };
in {
    options.sshconn = with lib; with types; {
        connections = mkOption {
            type = attrsOf (connection);
            description = "A set of available tagged connections";
            default = { };
        };
    };
}
