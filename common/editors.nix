{config, pkgs, util-lib, ...}:

with util-lib; pkgDef {
	def_name = "main.editors";
	def = with pkgs; {
		kdenlive	= [(mkOptIn	"Install kdenlive.")	[kdenlive]];
		krita		= [(mkOptOut	"Install krita.")	[krita]];
	};
	inherit config;
}
