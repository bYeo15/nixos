{ inputs, config, lib, pkgs, ... }:

let
    rofi-quicksearch = pkgs.writeShellScriptBin "rofi-quicksearch" ''
        BROWSER=firefox
        ARGS=--private-window
        ENGINE="https://duckduckgo.com/?q="

        REGEX_SITE="[^\s]+\.[^\s]+"

        SEARCH=''$(echo | rofi -dmenu -p "Search Term: " -theme-str 'window{height:32;}')

        if [[ -z ''$SEARCH ]]; then exit 1; fi

        swaymsg -q [title='.*Private.*'] focus

        if [[ ''$SEARCH =~ ''$REGEX_SITE ]]; then
            exec ''${BROWSER} ''${ARGS} "''${SEARCH}"
        else
            exec ''${BROWSER} ''${ARGS} "''${ENGINE}''${SEARCH}"
        fi
    '';

    devshell-manager = pkgs.writeShellScriptBin "devsh" ''
        TARGET_DEVSHELL=${config.devshells.devshells.default}

        case $1 in
            "help" | "--help")
                echo "Usage: <shell>"
                echo -e "${lib.attrsets.foldlAttrs (acc: n: v: acc + "\n\t${n}") "Available Shells:" config.devshells.devshells}"
                exit 0
            ;;
            ${lib.attrsets.foldlAttrs (acc: n: v: acc + "${n})\nTARGET_DEVSHELL=${v}\n;;\n") "" config.devshells.devshells}
            "")
            ;;
            *)
                echo "[ ERROR ] : ''$1 is not a known devshell"
                exit 1
            ;;
        esac

        cp "''$TARGET_DEVSHELL" ./shell.nix
        chmod u+w ./shell.nix
        npins init
        echo "use nix" > ./.envrc
    '';
in {
    home.packages = [
        rofi-quicksearch

        devshell-manager
    ];
}
