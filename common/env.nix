{config, pkgs, util-lib, ...}:
with util-lib; pkgDef {
	def_name = "main.env";
	def = with pkgs; {
		direnv	= [(mkOptIn	"Install direnv.")	[direnv nix-direnv]];
	};
	inherit config;
}
