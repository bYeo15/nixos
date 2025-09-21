{ inputs, config, lib, pkgs, ... }:

{
    home.pointerCursor = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
        x11 = {
            enable = true;
            defaultCursor = "Adwaita";
        };
        gtk.enable = true;
    };

    gtk = {
        enable = true;

        theme = {
            name = "Adwaita";
            package = pkgs.gnome-themes-extra;
        };
        cursorTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
            size = 24;
        };
        iconTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
        };

        gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
}
