{ inputs, config, lib, pkgs, ... }:

{
    programs.cmus = with config.renix.activeTheme; {
        enable = true;
        extraConfig = ''
            set format_current=%{artist} - %{album}%! - %{title}
            set format_heading_album=%{artist} - %{album}%= %{duration}
            set format_heading_artist=%{artist}%= %{duration}
            set format_title=%{artist} - %{album} - %{title}
            set format_trackwin=%{title}%= %{duration}
            set format_trackwin_album=%{album} %= %{duration}
            set format_treewin=  %{album}
            set sort_albums_by_name=true
            set pause_on_output_change=true
            set auto_expand_albums_search=false
            set repeat=true
            set color_cmdline_bg=${termColour.clTextBG}
            set color_cmdline_fg=${termColour.clText}
            set color_cmdline_attr=bold
            set color_separator=${termColour.clAccent}
            set color_statusline_bg=${termColour.clTextBG}
            set color_statusline_fg=${termColour.clText}
            set color_statusline_attr=default
            set color_titleline_bg=${termColour.clAccentBG}
            set color_titleline_fg=${termColour.clAccent}
            set color_titleline_attr=bold
            set color_win_bg=${termColour.clTextBG}
            set color_win_cur=${termColour.clText}
            set color_win_cur_attr=bold
            set color_win_cur_sel_bg=${termColour.clAccentBG}
            set color_win_cur_sel_fg=${termColour.clAccent}
            set color_win_cur_sel_attr=bold
            set color_win_dir=${termColour.clText}
            set color_win_fg=${termColour.clText}
            set color_win_inactive_cur_sel_bg=${termColour.clTextBG}
            set color_win_inactive_cur_sel_fg=${termColour.clText}
            set color_win_inactive_cur_sel_attr=bold
            set color_win_inactive_sel_bg=${termColour.clTextBG}
            set color_win_inactive_sel_fg=${termColour.clText}
            set color_win_sel_bg=${termColour.clAccentBG}
            set color_win_sel_fg=${termColour.clAccent}
            set color_win_sel_attr=bold
            set color_win_title_bg=${termColour.clAccentBG}
            set color_win_title_fg=${termColour.clAccent}
            set color_win_title_attr=bold
            fset soundtrack=artist="Soundtracks"
            factivate !soundtrack
        '';
    };
}
