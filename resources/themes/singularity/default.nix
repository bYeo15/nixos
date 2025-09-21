{ inputs, config, lib, pkgs, ... }:

{
    config.renix.themes."singularity" = {
        fontMono = "FreeMono";
        fontSerif = "FreeSerif";
        fontSans = "FreeSans";

        colour = {
            clTextBG = "121216";
            clAccentBG = "e8e6e1";
            clText = "e8e6e1";
            clAccent = "121216";
        };

        termColour = {
            clTextBG = "232";
            clAccentBG = "233";
            clText = "252";
            clAccent = "251";
        };

        resources = {
            background = ./background;
            fragment = ./fragment;
            helix_base = "carbonfox";
        };
    };
}
