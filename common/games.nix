{config, pkgs, util-lib, ...}:

with util-lib; pkgDef {
	def_name = "main.games";
	def = with pkgs; {
		minecraft	= [(mkOptIn	"Install minecraft.")	[minecraft]];
	};
	cfg = config;
}
