{ inputs, config, lib, pkgs, utilities, ... }:

{
    programs.ssh = {
        matchBlocks = utilities.filterTagged "block" [ "all" "git" ] config.sshconn.connections;
    };
}
