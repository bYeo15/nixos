{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./ageSecrets.nix
        ./bluedev.nix
        ./devshells.nix
        ./netconn.nix
        ./renix.nix
        ./sshconn.nix
    ];
}
