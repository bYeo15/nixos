{ inputs, config, lib, pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        terminal = "foot";
        theme = let
            inherit (config.lib.formats.rasi) mkLiteral;
        in with config.renix.activeTheme; {
            "*" = {
                font = "${fontMono} ${toString fontSizeNormal}";
                margin = 0;
                padding = 0;
                spacing = 0;
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "#${colour.clText}";
            };

            "window" = {
                location = mkLiteral "center";
                width = 720;
                height = 720;
                background-color = mkLiteral "#${colour.clTextBG}";
            };

            "inputbar" = {
                spacing = 8;
                padding = 8;
                background-color = mkLiteral "#${colour.clTextBG}";
            };

            "prompt, entry, element-text" = {
                vertical-align = mkLiteral "0.5";
            };

            "prompt" = {
                text-color = mkLiteral "#${colour.clText}";
            };

            "textbox" = {
                padding = 8;
                background-color = mkLiteral "#${colour.clTextBG}";
            };

            "listview" = {
                padding = mkLiteral "4px 0";
                lines = 8;
                columns = 1;

                fixed-height = true;
            };

            "element" = {
                padding = 8;
                spacing = 8;
            };

            "element normal" = {
                text-color = mkLiteral "#${colour.clText}";
            };

            "element selected normal, element selected active" = {
                text-color = mkLiteral "#${colour.clAccent}";
                background-color = mkLiteral "#${colour.clAccentBG}";
            };

            "element-text" = {
                text-color = mkLiteral "inherit";
                font = mkLiteral "inherit";
            };

            "element-text selected" = {
                text-transform = mkLiteral "bold";
            };
        };
    };
}
