{config, pkgs, util-lib, ...}:

let
	discord-latest = pkgs.discord.overrideAttrs (old: {
		withOpenASAR = true;
		version = "0.0.21";
		src = pkgs.fetchurl {
			url = "https://dl.discordapp.net/apps/linux/0.0.20/discord-0.0.21.tar.gz";
			sha256 = "18rmw979vg8lxxvagji6sim2s5yyfq91lfabsz1wzbniqfr98ci8";
		};
	});
in with util-lib; pkgDef {
	def_name = "main.communication";
	def = with pkgs; {
		discord	= [(mkOptIn	"Install discord.")		[discord-latest]];
		irc	= [(mkOptIn	"Install weechat irc client.")	[weechat-unwrapped]];
	};
	inherit config;
}
