{ inputs, config, lib, pkgs, utilities, ... }:

{
    programs.ssh = {
        enable = true;
        matchBlocks = utilities.filterTagged "block" [ "all" "git" ] config.sshconn.connections;
    };
}
