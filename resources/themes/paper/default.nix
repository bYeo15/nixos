{ inputs, config, lib, pkgs, ... }:

{
    config.renix.themes."paper" = {
        fontMono = "DepartureMono";
        fontSerif = "FreeSerif";
        fontSans = "FreeSans";

        colour = {
            clTextBG = "382b26";
            clAccentBG = "b8c2b9";
            clText = "b8c2b9";
            clAccent = "382b26";
        };

        termColour = {
            clTextBG = "232";
            clAccentBG = "233";
            clText = "252";
            clAccent = "251";
        };

        resources = {
            background = ./resources/paper/background;
        };
    };
}
