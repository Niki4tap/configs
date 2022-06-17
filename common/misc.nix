{util-lib, pkgs, ...}:

with util-lib; pkgDef {
	def_name = "main.misc";	
	def = with pkgs; {
		chromium	= [(mkOptOut	"Install chromium")	[chromium]];
	};
	inherit config;
}
