{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./logind.nix
        ./openssh.nix
        ./openvpn.nix
        ./pipewire.nix
        ./tlp.nix
        ./tuigreet.nix
    ];
}
