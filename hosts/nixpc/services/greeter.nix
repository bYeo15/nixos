{ inputs, config, lib, pkgs, ... }:

{
    services.getty.autologinUser = "gaming";

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "startx \$(which steamLauncher)";
                user = "gaming";
            };
        };
    };
}
