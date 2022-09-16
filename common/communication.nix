{config, pkgs, util-lib, ...}:

let
	discord-latest = pkgs.discord.overrideAttrs (old: {
		version = "0.0.20";
		src = pkgs.fetchurl {
			url = "https://dl.discordapp.net/apps/linux/0.0.20/discord-0.0.20.tar.gz";
			sha256 = "1355xiw0k0i6cbi1zcq7fphma6r8hz87lhm8ybg5s45032xz5znx";
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
