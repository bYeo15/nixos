{ inputs, config, lib, pkgs, ... }:

{
    programs.foot = with config.renix.activeTheme; {
        enable = true;
        settings = {
            main = {
                font = "${fontMono}:size=${toString fontSizeNormal}";
            };
            colors = {
                foreground = colour.clText;
                background = colour.clTextBG;
                cursor = "${colour.clAccent} ${colour.clAccentBG}";
                "${termColour.clTextBG}" = colour.clTextBG;
                "${termColour.clAccentBG}" = colour.clAccentBG;
                "${termColour.clText}" = colour.clText;
                "${termColour.clAccent}" = colour.clAccent;
            };
            key-bindings = {
                search-start = "Control+slash";
            };
        };
    };
}
