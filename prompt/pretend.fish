# Colorscheme: ayu Dark
set -gx fish_color_normal B3B1AD
set -gx fish_color_command 39BAE6
set -gx fish_color_quote C2D94C
set -gx fish_color_redirection FFEE99
set -gx fish_color_end F29668
set -gx fish_color_error FF3333
set -gx fish_color_param B3B1AD
set -gx fish_color_comment 626A73
set -gx fish_color_match F07178
set -gx fish_color_selection --background=E6B450
set -gx fish_color_search_match --background=E6B450
set -gx fish_color_history_current --bold
set -gx fish_color_operator E6B450
set -gx fish_color_escape 95E6CB
set -gx fish_color_cwd 59C2FF
set -gx fish_color_cwd_root red
set -gx fish_color_valid_path --underline
set -gx fish_color_autosuggestion 4D5566
set -gx fish_color_user brgreen
set -gx fish_color_host normal
set -gx fish_color_cancel --reverse
set -gx fish_pager_color_prefix normal --bold --underline
set -gx fish_pager_color_progress brwhite --background=cyan
set -gx fish_pager_color_completion normal
set -gx fish_pager_color_description B3A06D
set -gx fish_pager_color_selected_background --background=E6B450
set -gx fish_color_option
set -gx fish_pager_color_secondary_background
set -gx fish_pager_color_secondary_description
set -gx fish_pager_color_selected_prefix
set -gx fish_pager_color_secondary_prefix
set -gx fish_pager_color_selected_completion
set -gx fish_pager_color_selected_description
set -gx fish_pager_color_secondary_completion
set -gx fish_color_keyword
set -gx fish_color_host_remote
set -gx fish_pager_color_background

function actual_exit
	while read --nchars 3 --local response --prompt-str="Are you sure you want to exit? (y/n) "
		switch $response
			case Y Yes y yes
				echo "exiting..."
				builtin exit
			case N No n no
				break
			case '*'
				echo Not valid input
		end
	end
end

bind \cd "actual_exit; fish_prompt"
alias exit="actual_exit"
