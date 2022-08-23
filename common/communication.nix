{config, pkgs, util-lib, ...}:

let
	discord-latest = pkgs.discord.overrideAttrs (old: {
		version = "0.0.19";
		src = pkgs.fetchurl {
			url = "https://dl.discordapp.net/apps/linux/0.0.19/discord-0.0.19.tar.gz";
			sha256 = "1403vdc7p6a8mhr114brfp4dqvikaj5s71wrx20ca5y6srsv5x0r";
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
