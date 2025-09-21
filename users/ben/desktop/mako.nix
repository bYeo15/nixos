{ inputs, config, lib, pkgs, ... }:

{
    # TODO : Proper Mako config (modes + bindings)
    services.mako = {
        enable = true;
        settings = with config.renix.activeTheme; {
            background-color = "#${colour.clTextBG}";
            text-color = "#${colour.clText}";
            border-color = "#${colour.clAccent}";
            font = "${fontMono} ${toString fontSizeNormal}";
            anchor = "bottom-right";

            format = "<b>[ %a : %s ]</b>\\n %b";

            "actionable=true" = {
                anchor = "top-right";
            };
        };
    };
}
