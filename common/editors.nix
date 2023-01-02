{config, pkgs, util-lib, ...}:

with util-lib; pkgDef {
	def_name = "main.editors";
	def = with pkgs; {
		codium		= [(mkOptOut	"Install codium.")	[vscodium]];
		clion		= [(mkOptIn	"Install clion.")	[jetbrains.clion]];
		pycharm		= [(mkOptIn	"Install pycharm.")	[jetbrains.pycharm-community]];
		kdenlive	= [(mkOptIn	"Install kdenlive.")	[kdenlive]];
		krita		= [(mkOptOut	"Install krita.")	[krita]];
	};
	inherit config;
}
