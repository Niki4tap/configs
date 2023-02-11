function fish_prompt
	up_prompt
end

function fish_right_prompt
	up_right_prompt
end

function up_prompt
	printf \
		"%s%s       %s %s" \
		(set_color -r bryellow) \
		(set_color -b bryellow bryellow) \
		(set_color -b normal bryellow) \
		(set_color normal)
end

function up_right_prompt
	echo "󰣙"
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
