{ inputs, config, lib, pkgs, ... }:

let
    rofi-quicksearch = pkgs.writeShellScriptBin "rofi-quicksearch" ''
        BROWSER=firefox
        ARGS=--private-window
        ENGINE="https://duckduckgo.com/?q="

        REGEX_SITE="[^\s]+\.[^\s]+"

        SEARCH=''$(rofi -dmenu -p "Search Term: " -theme-str 'window{height:32;}')

        if [[ -z ''$SEARCH ]]; then exit 1; fi

        swaymsg -q [title='.*Private.*'] focus

        if [[ ''$SEARCH =~ ''$REGEX_SITE ]]; then
            exec ''${BROWSER} ''${ARGS} "''${SEARCH}"
        else
            exec ''${BROWSER} ''${ARGS} "''${ENGINE}''${SEARCH}"
        fi
    '';
in {
    home.packages = [
        rofi-quicksearch
    ];
}
