{ inputs, config, lib, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = {
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
                    format = "{icon} {count}";
                    show-empty = false;
                    format-icons = [ "" ""];
                    tooltip = true;
                    tooltip-format = "{app}: {title}";
                };

                "idle_inhibitor" = {
                    format = "{icon}";
                    format-icons = {
                        activated = "";
                        deactivated = "";
                    };
                };

                "clock" = {
                    format = "{:%I:%M}";
                    tooltip = true;
                    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                    format-alt = "{:%Y-%m-%d}";
                };

                "cpu" = {
                    format = "{usage}%";
                    tooltip = false;
                };

                "memory" = {
                    format = "{}%";
                };

                "backlight" = {
                    format = "{percent}%";
                };

                "battery" = {
                    states = {
                        good = 95;
                        warning = 30;
                        critical = 15;
                    };
                    format = "{capacity}% {icon}";
                    format-full = "{capacity}% {icon}";
                    format-charging = "{capacity}% ";
                    format-plugged = "{capacity}% ";
                    format-alt = "{time} {icon}";
                    format-icons = [ "" "" "" "" "" ];
                };

                "network" = {
                    format-wifi = "{essid} ({signalStrength}%) ";
                    format-ethernet = "{ipaddr}/{cidr} ";
                    tooltip-format = "{ifname} via {gwaddr} ";
                    format-linked = "{ifname} (No IP) ";
                    format-disconnected = "Disconnected ⚠";
                    format-alt = "{ifname}: {ipaddr}/{cidr}";
                };

                "pulseaudio" = {
                    format = "{volume}% {icon} {format_source}";
                    format-bluetooth = "{volume}% {icon} {format_source}";
                    format-bluetooth-muted = " {icon} {format_source}";
                    format-muted = " {format_source}";
                    format-source = "{volume}% ";
                    format-source-muted = "";
                    format-icons = {
                        headphone = "";
                        hands-free = "";
                        headset = "";
                        phone = "";
                        portable = "";
                        car = "";
                        default = "";
                    };
                };
            };
        };

        style = with config.renix.activeTheme; ''
            * {
                border: none;
                border-radius: 0px;
                font-family: ${fontMono};
                font-size: ${toString fontSizeLarge}px;
                min-height: 0;
            }
            window#waybar {
                background-color: #${colour.clTextBG};
                color: #${colour.clText};
            }
            #workspaces button {
                padding: 0px 8px;
                color: #${colour.clText};
                background-color: transparent;
            }
            #workspaces button:hover {
                background-color: transparent;
                background: #${colour.clAccentBG};
                border: transparent;
            }
            #workspaces button.focused {
                background-color: #${colour.clAccentBG};
                color: #${colour.clAccent};
            }
            #workspaces button.urgent {
                background-color: #${colour.clAccentBG};
                color: #${colour.clAccent};
            }
            #mode {
                padding: 0 10px;
                margin: 6px 3px;
                background-color: transparent;
                background: transparent;
                color: #${colour.clText};
                border: 0.5px solid #${colour.clText};
            }
            #window,
            #clock,
            #battery,
            #cpu,
            #memory,
            #backlight,
            #network,
            #pulseaudio,
            #tray,
            #idle_inhibitor {
                padding: 0 10px;
                margin: 6px 3px;
                color: #${colour.clText};
                background-color: transparent;
            }
            #clock {
                color: #${colour.clText};
            }
            #battery {
                color: #${colour.clText};
            }
            #battery.charging {
                color: #${colour.clText};
            }
            @keyframes blink {
                to {
                    background-color: #${colour.clText};
                    color: #${colour.clTextBG};
                }
            }
            #battery.critical:not(.charging) {
                background-color: #${colour.clAccentBG};
                color: #${colour.clAccent};
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }
            label:focus {
                background-color: #${colour.clTextBG};
            }
            #cpu {
                color: #${colour.clText};
            }
            #memory {
                color: #${colour.clText};
            }
            #backlight {
                color: #${colour.clText};
            }
            #network {
                color: #${colour.clText};
            }
            #pulseaudio {
                color: #${colour.clText};
            }
            #pulseaudio.muted {
                color: #${colour.clText};
            }
            #tray {
                background-color: #${colour.clAccentBG};
            }
            #idle_inhibitor {
                border-radius: 4px;
                background-color: #${colour.clTextBG};
                padding: 8px 10px;
            }
            #idle_inhibitor.activated {
                background-color: #${colour.clAccentBG};
                color: #${colour.clAccent};
            }
            '';
    };
}
