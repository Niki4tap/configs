{config, pkgs, util-lib, ...}:

let
	rust-host = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.minimal.override {extensions = ["rust-src" "rust-docs"];});
	rust-full = pkgs.rust-bin.selectLatestNightlyWith
		(toolchain: toolchain.minimal.override
			{
				extensions = ["rust-src" "miri" "rustfmt" "rust-docs" "rls" "rust-analysis"];
				targets = ["x86_64-unknown-linux-gnu" "aarch64-unknown-linux-musl" "x86_64-unknown-linux-musl" "i686-unknown-linux-musl" "x86_64-apple-darwin" "x86_64-pc-windows-gnu" "i686-pc-windows-msvc"];
			}
		);
in with util-lib; pkgDef {
	def_name = "main.lang";
	def = with pkgs; {
		llvm_extra	= [(mkOptIn	"Install llvm tools.")			[llvmPackages.bintools-unwrapped]];
		gcc		= [(mkOptIn	"Install gcc.")				[gcc]];
		clang		= [(mkOptOut	"Install clang.")			[clang]];
		clang-tools	= [(mkOptIn	"Install clang tools.")			[clang-tools]];
		cling		= [(mkOptIn	"Install cling.")			[cling]];
		python		= [(mkOptOut	"Install python v3.10.")		[python310]];
		python_extra	= [(mkOptOut	"Install extra libs for python.")	[python310Packages.requests python310Packages.pip]];
		rust-minimal	= [(mkOptOut	"Install host rust toolchain.")		[rust-host rustup]];
		rust-full	= [(mkOptIn	"Install all of the toolchains.")	[rust-full rustup]];
		java8		= [(mkOptIn	"Install java v8.")			[jre8]];
	};
	inherit config;
}
