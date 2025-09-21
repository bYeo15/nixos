{ inputs, config, lib, pkgs, ... }:

{
    home.shellAliases = {
        c = "clear; echo \"\${PS1@P}\"; ls";
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        glow = "glow -n";
        zpdf = "zathura --fork";
        foot-detach = "foot & disown";
        icat = "img2sixel";
        nsh = "nix-shell -p";
        hms = "home-manager switch --flake ~/.nixconf#ben";
    };

    home.sessionVariables = {
        EDITOR = "hx";
        GRIM_DEFAULT_DIR = "~/media/images/cap";
        XDG_CURRENT_DESKTOP = "sway";
    };

    programs.bash = with config.renix.activeTheme; {
        enable = true;
        bashrcExtra = ''
            export PS1="\\n\\[\\033[1;38;5;${termColour.clText}m\\][\\[\\e]0;\\u@\\h: \\w\\a\\]\\u@\\h:\\w]\\$ \\[\\033[0m\\]";
            osc7_cwd() {
                local strlen=''${#PWD}
                local encoded=""
                local pos c o
                for (( pos=0; pos<strlen; pos++ )); do
                    c=''${PWD:$pos:1}
                    case "$c" in
                        [-/:_.!\'\(\)!~[:alnum:]] ) o="''${c}" ;;
                        * ) printf -v o '%%%02X' "''\'''${c}" ;;
                    esac
                    encoded+="''${o}"
                done
                printf '\e]7;file://%s%s\e\\' "''${HOSTNAME}" "''${encoded}"
            }
            PROMPT_COMMAND=''${PROMPT_COMMAND:+''${PROMPT_COMMAND%;}; }osc7_cwd
            nrun() { PROG="$1"; shift; nix run nixpkgs#"''${PROG}" -- ''$@; }
            nrs() { if [[ "''$#" -ne 1 ]]; then echo "Usage: <system derivation name>"; else nixos-rebuild switch --flake ~/.nixconf#"''$1" --sudo; fi; }
        '';

        historyIgnore = [
            "ls"
            "cd"
            "exit"
            "clear"
        ];
    };
}
