{pkgs, util-lib, ...}:

with util-lib; pkgDef {
	def_name = "main.lang";
	def = with pkgs; {
		llvm_extra		= [(mkOptIn		"Install llvm tools.")				[llvmPackages.bintools-unwrapped]];
		gcc				= [(mkOptIn		"Install gcc.")						[gcc]];
		clang			= [(mkOptOut	"Install clang.")					[clang]];
		python			= [(mkOptOut	"Install python v3.10.")			[python310]];
		python_extra	= [(mkOptOut	"Install extra libs for python.")	[python310Packages.requests python310Packages.pip]];
		rust			= [(mkOptIn		"Install rust.")					[rust-bin.stable.latest.default rustup]];
		java8			= [(mkOptIn		"Install java v8.")					[jre8]];
	};
}