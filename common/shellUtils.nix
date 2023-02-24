{config, pkgs, util-lib, ...}:

with util-lib; pkgDef {
	def_name = "main.shellUtils";
	def = with pkgs; {
		dbg		= [(mkOptOut	"Install debugging programs.")		[gdb]];
		cool_looking	= [(mkOptOut	"Install cool looking programs.")	[neofetch cpufetch lolcat bat icdiff]];
		basics		= [(mkOptOut	"Install basic shell utilities.")	[pciutils file wget curl ripgrep hexedit imagemagick]];
		git		= [(mkOptOut	"Install git.")				[git]];
		earlyoom	= [(mkOptIn	"Install earlyoom.")			[earlyoom]];
		xclip		= [(mkOptOut	"Install xclip.")			[xclip]];
		ffmpeg		= [(mkOptIn	"Install ffmpeg.")			[ffmpeg-full]];
		nmap		= [(mkOptOut	"Install nmap.")			[nmap]];
		dig		= [(mkOptOut	"Install dig.")				[dig]];
		htop		= [(mkOptOut	"Install htop.")			[htop]];
		bpytop		= [(mkOptIn	"Install bpytop.")			[bpytop]];
		# Let's see how this goes?
		zellij		= [(mkOptOut	"Install zellij.")			[zellij]];
		# sorry tmux, sorry screen :)
		tmux		= [(mkOptIn	"Install tmux.")			[tmux]];
		screen		= [(mkOptIn	"Install screen.")			[screen]];
	};
	inherit config;
}
