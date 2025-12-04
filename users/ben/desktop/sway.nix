{ inputs, config, lib, pkgs, ... }:

let
    home-opacity = "0.85";
    term = "${pkgs.foot}/bin/foot";
    wsHome = "0:⌂";
in with config.renix.activeTheme; {
    wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        checkConfig = false;
        config = with config.renix.activeTheme; rec {
            output = {
                eDP-1 = {
                    resolution = "1920x1200";
                    position = "1200 0";
                };
                HDMI-A-1 = {
                    resolution = "1920x1200";
                    position = "3120 0";
                };
                DP-7 = {
                    resolution = "1920x1200";
                    position = "3120 0";
                };
                DP-8 = {
                    resolution = "1920x1200";
                    position = "0 0";
                    transform = "90";

                };
                DP-9 = {
                    resolution = "1920x1200";
                    position = "0 0";
                    transform = "90";
                };

                "*" = {
                    bg = "${resources.background} fill";
                };
            };

            input = {
                "type:touchpad" = {
                    dwt = "disabled";
                    tap = "enabled";
                    accel_profile = "flat";
                    pointer_accel = "0.3";
                    scroll_factor = "0.4";
                };
            };

            bindswitches = {
                "lid:on" = {
                    reload = true;
                    locked = true;
                    action = "exec ${pkgs.swaylock}/bin/swaylock ; output * power off";
                };
                "lid:off" = {
                    reload = true;
                    locked = true;
                    action = "output * power on";
                };
            };

            colors = {
                focused = {
                    background = "#${colour.clAccentBG}";
                    border = "#${colour.clAccentBG}";
                    text = "#${colour.clAccent}";
                    indicator = "#${colour.clAccentBG}";
                    childBorder = "#${colour.clAccentBG}";
                };
                focusedInactive = {
                    background = "#${colour.clTextBG}";
                    border = "#${colour.clTextBG}";
                    text = "#${colour.clText}";
                    indicator = "#${colour.clTextBG}";
                    childBorder = "#${colour.clTextBG}";
                };
                unfocused = {
                    background = "#${colour.clTextBG}";
                    border = "#${colour.clTextBG}";
                    text = "#${colour.clText}";
                    indicator = "#${colour.clTextBG}";
                    childBorder = "#${colour.clTextBG}";
                };
                urgent = {
                    background = "#${colour.clAccentBG}";
                    border = "#${colour.clAccentBG}";
                    text = "#${colour.clAccent}";
                    indicator = "#${colour.clAccentBG}";
                    childBorder = "#${colour.clAccentBG}";
                };
            };

            fonts = {
                names = [ "\"${fontMono}\"" "mono" ];   # Fallback to default monospace
                size = fontSizeNormal + 0.0;
            };

            gaps = {
                inner = 0;
                smartGaps = true;
            };

            window = {
                border = 0;
                hideEdgeBorders = "smart";
                titlebar = false;

                commands = [
                    {
                        command = "inhibit_idle focus; fullscreen enable";

                        criteria = {
                            instance = "freetube";
                        };
                    }
                    {
                        command = "border normal 0";

                        criteria = {
                            app_id = "foot";
                        };
                    }
                    {
                        command = "move to workspace ${wsHome}; opacity ${home-opacity}";

                        criteria = {
                            app_id = "cmus";
                        };
                    }
                    {
                        command = "title_format \"%title (%app_id%class)\"";

                        criteria = {
                            all = true;
                        };
                    }
                ];
            };

            floating = {
                border = 0;
                titlebar = true;
            };

            startup = [
                {
                    always = false;
                    command = "${term} --app-id=cmus cmus";
                }
                {
                    always = false;
                    command = ''
                        ${pkgs.swayidle}/bin/swayidle -w timeout 60 '${pkgs.swaylock}/bin/swaylock' timeout 90 '${pkgs.sway}/bin/swaymsg "output * dpms off"' resume '${pkgs.sway}/bin/swaymsg "output * dpms on"' before-sleep ${pkgs.swaylock}/bin/swaylock
                        '';
                }
            ] ++ lib.optionals (resources ? "fragment") [
                {
                    always = false;
                    command = ''
                        ${pkgs.glpaper}/bin/glpaper -F eDP-1 ${resources.fragment}
                    '';
                }
                {
                    always = false;
                    command = ''
                        ${pkgs.glpaper}/bin/glpaper -F HDMI-A-1 ${resources.fragment}
                    '';
                }
                {
                    always = false;
                    command = ''
                        ${pkgs.glpaper}/bin/glpaper -F DP-7 ${resources.fragment}
                    '';
                }
                {
                    always = false;
                    command = ''
                        ${pkgs.glpaper}/bin/glpaper -F DP-8 ${resources.fragment}
                    '';
                }
                {
                    always = false;
                    command = ''
                        ${pkgs.glpaper}/bin/glpaper -F DP-9 ${resources.fragment}
                    '';
                }
            ];

            bars = [ ];
        };

        extraConfig = ''
            bindgesture swipe:3:left workspace prev
            bindgesture swipe:3:right workspace next
            bindgesture swipe:3:down workspace ${wsHome}
            bindgesture swipe:3:up workspace back_and_forth
            workspace ${wsHome} output eDP-1
            include /etc/sway/config.d/*
        '';
    };

    services.cliphist = {
        enable = true;
        allowImages = true;
    };

    xdg.portal = {
        enable = true;
        config = {
            common = {
                default = [
                    "wlr"
                ];
            };
        };
        extraPortals = [
            pkgs.xdg-desktop-portal-wlr
        ];
    };
}
