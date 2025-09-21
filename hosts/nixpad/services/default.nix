{ inputs, config, lib, pkgs, ... }:

{
    imports = [
        ./dbus.nix
        ./envfs.nix
        ./logind.nix
        ./openssh.nix
        ./openvpn.nix
        ./pipewire.nix
        ./tlp.nix
        ./tuigreet.nix
    ];
}
