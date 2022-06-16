{config, pkgs, util-lib, ...}:

let
	discord-latest = pkgs.discord.overrideAttrs (old: {
		version = "0.0.18";
		src = pkgs.fetchurl {
			url = "https://dl.discordapp.net/apps/linux/0.0.18/discord-0.0.18.tar.gz";
			sha256 = "sha256-BBc4n6Q3xuBE13JS3gz/6EcwdOWW57NLp2saOlwOgMI=";
		};
	});
in with util-lib; pkgDef {
	def_name = "main.communication";
	def = with pkgs; {
		discord	=	[(mkOptIn "Install discord.")			[discord-latest]];
		irc	=	[(mkOptIn "Install weechat irc client.")	[weechat-unwrapped]];
	};
	inherit config;
}
