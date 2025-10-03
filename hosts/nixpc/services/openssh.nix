{ inputs, config, lib, pkgs, ... }:

{
    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
            X11Forwarding = true;
        };
    };
}
