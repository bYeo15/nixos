{ inputs, config, lib, pkgs, ... }:

{
    programs.swaylock = with config.renix.activeTheme; {
        enable = true;

        settings = {
            ignore-empty-password = true;
            daemonize = true;
            color = colour.clTextBG;
            font-size = fontSizeLarge;
            font = fontMono;
            indicator-idle-visible = false;
            inside-color = "00000000";
            inside-clear-color = colour.clTextBG;
            inside-caps-lock-color = colour.clTextBG;
            inside-ver-color = colour.clTextBG;
            inside-wrong-color = colour.clTextBG;
            key-hl-color = colour.clAccent;
            layout-bg-color = colour.clTextBG;
            layout-border-color = colour.clText;
            layout-text-color = colour.clText;
            line-color = colour.clAccent;
            ring-color = colour.clAccentBG;
            separator-color = colour.clText;
            text-color = colour.clText;
            image = "${resources.background}";
        };
    };
}
