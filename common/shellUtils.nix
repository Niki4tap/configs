{config, pkgs, util-lib, ...}:

with util-lib; pkgDef {
	def_name = "main.shellUtils";
	def = with pkgs; {
		cool_looking	= [(mkOptOut	"Install cool looking programs.")	[neofetch cpufetch lolcat bat]];
		basics		= [(mkOptOut	"Install basic shell utilities.")	[pciutils file wget]];
		git		= [(mkOptOut	"Install git.")				[git]];
		earlyoom	= [(mkOptIn	"Install earlyoom.")			[earlyoom]];
		xclip		= [(mkOptIn	"Install xclip.")			[xclip]];
		ffmpeg		= [(mkOptIn	"Install ffmpeg.")			[ffmpeg-full]];
		nmap		= [(mkOptOut	"Install nmap.")			[nmap]];
		dig		= [(mkOptOut	"Install dig.")				[dig]];
		htop		= [(mkOptIn	"Install htop.")			[htop]];
		bpytop		= [(mkOptIn	"Install bpytop.")			[bpytop]];
		tmux		= [(mkOptOut	"Install tmux.")			[tmux]];
		screen		= [(mkOptIn	"Install screen.")			[screen]];
	};
	cfg = config;
}
