{ inputs, config, lib, pkgs, ... }:

{
    config.renix.themes."city" = {
        fontMono = "FreeMono";
        fontSerif = "FreeSerif";
        fontSans = "FreeSans";

        colour = {
            clTextBG = "1d1425";
            clAccentBG = "32134a";
            clText = "f0f0ea";
            clAccent = "f0f0ea";
        };

        termColour = {
            clTextBG = "17";
            clAccentBG = "19";
            clText = "254";
            clAccent = "255";
        };

        resources = {
            background = ./background;
        };
    };
}
