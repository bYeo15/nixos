{ inputs, config, lib, pkgs, ... }:

let
    palette = with lib; with types; submodule {
        options = {
            clTextBG = mkOption {
                type = str;
                description = "Palette background colour (paired with text)";
            };
            clAccentBG = mkOption {
                type = str;
                description = "Palette background colour (paired with accent)";
            };
            clText = mkOption {
                type = str;
                description = "Palette text colour";
            };
            clAccent = mkOption {
                type = str;
                description = "Palette accent colour";
            };
        };
    };
    theme = with lib; with types; submodule {
        options = {
            colour = mkOption {
                type = palette;
                description = "The main colour palette";
            };
            termColour = mkOption {
                type = palette;
                description = "The terminal colour palette";
            };
            fontMono = mkOption {
                type = str;
                description = "The default monospace font";
            };
            fontSerif = mkOption {
                type = str;
                description = "The default serif font";
            };
            fontSans = mkOption {
                type = str;
                description = "The default sans-serif font";
            };
            fontSizeLarge = mkOption {
                type = int;
                description = "The default large font size";
                default = 15;
            };
            fontSizeNormal = mkOption {
                type = int;
                description = "The default normal font size";
                default = 12;
            };
            fontSizeSmall = mkOption {
                type = int;
                description = "The default small font size";
                default = 10;
            };
            resources = mkOption {
                type = attrsOf (oneOf [ path str attrs ]);
                default = { };
                description = ''
                    A set of available resources
                    Recognised resources are;
                        - background [path] : The background image for the desktop & lock screen
                        - fragment [path] : The fragment shader to be launched as a desktop background
                        - helixBase [str] : The `helix` theme to use as a base for the custom theme
                        - waybarSettings [attrset] : An alternative waybar config
                '';
            };
        };
    };
in {
    options.renix = with lib; with types; {
        activeTheme = mkOption {
            type = theme;
            description = "The theme to use for the system";
        };
        themes = mkOption {
            type = attrsOf (theme);
            description = "A set of available themes";
            default = { };
        };
    };
}
