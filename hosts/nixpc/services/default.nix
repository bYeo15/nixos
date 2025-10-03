{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./openssh.nix
        ./pipewire.nix
    ];
}
