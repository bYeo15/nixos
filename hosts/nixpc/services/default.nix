{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./greeter.nix
        ./openssh.nix
        ./pipewire.nix
        ./sunshine.nix
    ];
}
