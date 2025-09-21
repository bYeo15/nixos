{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./ageSecrets.nix
        ./bluedev.nix
        ./netconn.nix
        ./renix.nix
        ./sshconn.nix
    ];
}
