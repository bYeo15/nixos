{ inputs, config, lib, pkgs, ... }:

{
    config.renix.themes."singularity" = {
        fontMono = "GohuFont";
        fontSizeNormal = 11;
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

            waybarSettings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    height = 30;
                    spacing = 5;

                    modules-left = [
                        "sway/workspaces"
                        "sway/mode"
                        "sway/scratchpad"
                        "idle_inhibitor"
                    ];

                    modules-center = [
                        "sway/window"
                    ];

                    modules-right = [
                        "pulseaudio"
                        "network"
                        "backlight"
                        "cpu"
                        "memory"
                        "battery"
                        "clock"
                    ];

                    "sway/workspaces" = {
                        format = "{name}";
                    };

                    "sway/mode" = {
                        format = "<span>{}</span>";
                        tooltip = false;
                    };

                    "sway/scratchpad" = {
                        format = "{icon}";
                        show-empty = false;
                        format-icons = [ "" "[≡]"];
                        tooltip = true;
                        tooltip-format=  "{app} : {title}";
                    };

                    "idle_inhibitor" = {
                        format = "<b>{icon}</b>";
                        format-icons = {
                            activated = "‹o›";
                            deactivated = "‹x›";
                        };
                    };

                    "clock" = {
                        format = "{:%I:%M}";
                        tooltip = true;
                        tooltip-format = "<tt><small>{calendar}</small></tt>";
                        format-alt = "{:%Y-%m-%d}";
                    };

                    "cpu" = {
                        format = "C:{usage}%";
                        tooltip = false;
                    };

                    "memory" = {
                        format = "M:{percentage}%";
                        tooltip = false;
                    };

                    "backlight" = {
                        format = "L:{percent}%";
                    };

                    "battery" = {
                        states = {
                            good = 75;
                            warning = 30;
                            critical = 15;
                        };
                        full-at = 75;
                        format = "B:{capacity}% {icon}";
                        format-full = "B:{capacity}% {icon}";
                        format-charging = "B:{capacity}% [⌁⌁⌁]";
                        format-plugged = "B:{capacity}% [■■■]";
                        format-icons = [ "[   ]" "[■  ]" "[■■ ]" "[■■■]" ];
                    };

                    "network" = {
                        format-wifi = "{essid} ({signalStrength}%)";
                        format-ethernet = "{ipaddr}/{cidr}";
                        format-disconnected = "Disconnected";
                        format-tooltip = "{ipaddr} -> {gwaddr}";
                    };

                    "pulseaudio" = {
                        format = "{volume}% | {format_source}";
                        format-bluetooth = "{volume}% ᛒ | {format_source}";
                        format-muted = "X | {format_source}";
                        format-source = "{volume}%";
                        format-source-muted = "X";
                    };
                };
            };
        };
    };
}
