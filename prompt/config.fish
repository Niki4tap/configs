if not begin; test -n "$active"; and test -n "$whitelist"; end
	set -gx active "none"
	set -gx whitelist (cat @out@/whitelist)
end

function fish_prompt
	if [ $active = "none" ]
		down_prompt
	else
		up_prompt
	end
end

function fish_right_prompt
	if [ $active = "none" ]
		down_right_prompt
	else
		up_right_prompt
	end
end

function up_prompt
	set -gx up_prompt_last_color bryellow
	printf \
		"%s%s %s %s %s %s %s%s " \
		(set_color -b bryellow black) \
		(set_color black) \
		(prompt_mod) \
		(prompt_user) \
		(prompt_host) \
		(prompt_nix_sh_pkgs) \
		(set_color -b normal $up_prompt_last_color) \
		(set_color normal)
end

function unsafe_switch
	if [ $active = "none" ]
		set -gx active "unsafe_switch"
	else
		decay
	end
end

function focus
	for target in $whitelist
		if string match -q "$target*" (path resolve $argv[1])
			set -gx active $target
			printf "%sswtiched to %s%s%s\n" \
				(set_color magenta) \
				(set_color cyan) \
				$target \
				(set_color normal)
			builtin cd $argv[1]
			return 0
		end
	end
	echo "out of luck"
	return 1
end

function decay
	if [ $active = "none" ]
		return 1
	else
		set -gx active "none"
		cd $HOME
		printf "%swelcome back%s\n" \
			(set_color red) \
			(set_color normal)
	end
end

function cd
	if [ $active = "unsafe_switch" ]
		builtin cd $argv
	end
	for target in $whitelist
		if test $active = "none"; and begin; string match -q "$target/*" (path resolve $argv[1]); or test (path resolve $argv[1]) = $target; end
			printf "%sfocus $argv%s\n" \
				(set_color brblack) \
				(set_color normal)
			return 1
		else if begin; test $active != "none"; or test $active != "unsafe_switch"; end; and begin; string match -q "$target/*" (path resolve $argv[1]); or test (path resolve $argv[1]) = $target; end
			builtin cd $argv
			return 0
		end
	end
	if [ $active != "none" ]
		printf "%sstay on point%s\n" \
			(set_color brblack) \
			(set_color normal)
		return 1
	else
		builtin cd $argv
	end
end

function prompt_mod
	if [ $active = "unsafe_switch" ]
		set -gx up_prompt_last_color green
		printf "%s%s  unsafe_switch %s %s" \
			(set_color brblack) \
			(set_color -b brblack red) \
			(set_color -b brblack black) \
			(prompt_dir)
	else if string match -q "$active/*" $PWD; or test (path resolve $active) = $PWD
		set -gx up_prompt_last_color brblack
		printf "%s%s %s (active) %s" \
			(set_color brblack) \
			(set_color -b brblack bryellow) \
			(string replace $active (basename $active) $PWD) \
			(set_color -b brblack black)
	else
		set -gx up_prompt_last_color brblack
		printf "%s%s $PWD (out-of-scope for %s) %s" \
			(set_color brblack) \
			(set_color -b brblack f58607) \
			(basename $active) \
			(set_color -b brblack black)
	end
end

function prompt_user
	set -gx up_prompt_last_color bryellow
	printf "%s%s  %s " \
		(set_color bryellow) \
		(set_color -b bryellow black) \
		(whoami)
end

function prompt_host
	set -gx up_prompt_last_color red
	printf "%s%s  %s " \
		(set_color red) \
		(set_color -b red black) \
		(hostname)
end

function prompt_dir
	set -gx up_prompt_last_color green
	printf "%s%s  %s" \
		(set_color green) \
		(set_color -b green black) \
		(pwd)
end

function prompt_nix_sh_pkgs
	if set -q ANY_NIX_SHELL_PKGS
		set -gx up_prompt_last_color cyan
		printf "%s%s %s " \
			(set_color cyan) \
			(set_color -b cyan black) \
			$ANY_NIX_SHELL_PKGS
	else
		echo -ne " "
	end
end

function up_right_prompt
	printf "%s%s     %s" \
		(set_color bryellow) \
		(set_color -b bryellow black) \
		(set_color -b normal normal)
end

function down_prompt
	printf \
		"%s\
╭─([%s%s%s]─[%s%s%s]─[%s%s%s])\n\
╰─> %s" \
		(set_color brblack) \
		(set_color red) \
		(whoami) \
		(set_color brblack) \
		(set_color red) \
		(hostname) \
		(set_color brblack) \
		(set_color red) \
		(pwd) \
		(set_color brblack) \
		(set_color normal)
end

function down_right_prompt
	set_color -o normal
	echo "("
	set_color purple
	random choice \
		"why are you still here?" \
		"nvm, doesn't matter anyways" \
		"yeah?" \
		"FIXME" \
		"you don't want to be here" \
		"i'm just a reminder :)" \
		"> KEEP THAT THING FLYING" \
		"remember?" \
		"you're not what you think you are" \
		"hello??" \
		"purple text" \
		"i don't even have to say anything" \
		"you already know it" \
		"what's the point" \
		"hey!" \
		"how" \
		"nothing good has happened since" \
		"look at the time" \
		"are you happy?" \
		"stop it" \
		"you know i mean it" \
		"you're not what others think you are" \
		"are you not tired of looking here?" \
		"waiting for something to happen?" \
		"niki4tap did not succumb" \
		"are you talking with yourself?" \
		"!!!" \
		"seriously?" \
		"another prompt, another quote" \
		"why" \
		"??" \
		"sudo poweroff?" \
		"this is getting sad, come back the other day?" \
		"TODO" \
		"just do it" \
		"still@home" \
		"rip++" \
		"what is wrong with you?" \
		"close your eyes" \
		"shine bright and burn out" \
		"think, think, think..." \
		"thread '<unnamed>' panicked, but you didn't" \
		"say something already" \
		"destroying the foundation of your beliefs" \
		"boo! did i scare you? you hope i did" \
		"you trap yourself and expect someone to get you out" \
		"niki4tap will not succumb" \
		"you wanna chat? too bad" \
		"hopeless" \
		"SIGTRAP: Trace/breakpoint trap" \
		"do you remember?" \
		"::reflect" \
		"*** CHANNEL mode set: +b (ban) for user @niki4tap" \
		"when" \
		"..." \
		"*** @niki4tap has been kicked by CHANNEL" \
		"sounds perfect, now do it" \
		"haha, that's cute, you are cute" \
		"just enough" \
		"nobody:x:65534:65534:/var/empty:/run/current-system/sw/bin/nologin" \
		"you don't deserve anything you have" \
		"do you have the time?" \
		"this is not going anywhere" \
		"fallback" \
		"looking for something?" \
		"quick, react!"
	set_color -o normal
	echo ")"
	set_color normal
end

function colorize
	set OUT (echo $argv | sha256sum - | awk '{print $1}')
	fish -c "$argv" > /tmp/$OUT.ansi 2>&1
	@python@/bin/python @out@/colorize.py "/tmp/$OUT.ansi"
	@vscode@/bin/code --disable-workspace-trust -wn "/tmp/$OUT.ansi"
	rm -f "/tmp/$OUT.ansi"
end

function rebuild
	git_configs add $HOME/code/nix/configs/
	git_configs status
	nixos-rebuild switch -j16 --cores 8 --use-remote-sudo --flake "/home/niki4tap/code/nix/configs#$(hostname)"
	source $HOME/.config/fish/config.fish
end

function git_configs --wraps git
	git --git-dir=$HOME/code/nix/configs/.git --work-tree=$HOME/code/nix/configs $argv
end

function whitelist_push
	if not [ -d $argv[1] ]
		return 1
	end
	echo "$argv[1]" >> $HOME/code/nix/configs/prompt/whitelist
	rebuild
end

function nix-shell --wraps nix-shell
	@any_nix_shell@/bin/.any-nix-shell-wrapper fish $argv
end

function pretend --wraps fish
	clear
	fish --private --interactive --no-config --init-command "source @out@/pretend.fish" $argv
end
