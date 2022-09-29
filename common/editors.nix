{config, pkgs, util-lib, ...}:

with util-lib; pkgDef {
	def_name = "main.editors";
	def = with pkgs; {
		clion		= [(mkOptIn	"Install clion.")	[jetbrains.clion]];
		pycharm		= [(mkOptIn	"Install pycharm.")	[jetbrains.pycharm-community]];
		vscode		= [(mkOptOut	"Install vscode.")	[vscode-fhs]];
		kdenlive	= [(mkOptIn	"Install kdenlive.")	[kdenlive]];
		krita		= [(mkOptOut	"Install krita.")	[krita]];
	};
	inherit config;
}
