{config, pkgs, util-lib, ...}:

let
	rust-host = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.minimal.override {extensions = ["rust-src" "rust-docs"];});
	rust-full = pkgs.rust-bin.selectLatestNightlyWith
		(toolchain: toolchain.minimal.override
			{
				extensions = ["rust-src" "llvm-tools" "rustc" "rustc-dev" "miri" "rustfmt" "rust-docs" "rls" "rust-analysis" "clippy"];
				targets = [
						"x86_64-unknown-linux-gnu"
						"aarch64-unknown-linux-musl"
						"x86_64-unknown-linux-musl"
						"i686-unknown-linux-musl"
						"x86_64-apple-darwin"
						"x86_64-pc-windows-gnu"
						"i686-pc-windows-msvc"
						"wasm32-unknown-unknown"
				];
			}
		);
in with util-lib; pkgDef {
	def_name = "main.lang";
	def = with pkgs; {
		rappel		= [(mkOptOut	"Install rappel (x64asm interpreter)")	[rappel]];
		llvm_extra	= [(mkOptIn	"Install llvm tools.")			[llvmPackages.bintools-unwrapped]];
		gcc		= [(mkOptIn	"Install gcc.")				[gcc]];
		clang		= [(mkOptOut	"Install clang.")			[clang]];
		clang-tools	= [(mkOptIn	"Install clang tools.")			[clang-tools]];
		cling		= [(mkOptIn	"Install cling.")			[cling]];
		python		= [(mkOptOut	"Install python v3.10.")		[python310]];
		python_extra	= [(mkOptOut	"Install extra libs for python.")	[python310Packages.requests python310Packages.pip]];
		evcxr		= [(mkOptOut	"Install evcxr, rust repl")		[evcxr]];
		rust-minimal	= [(mkOptOut	"Install host rust toolchain.")		[rust-host]];
		rust-full	= [(mkOptIn	"Install all of the toolchains.")	[rust-full]];
		java8		= [(mkOptIn	"Install java v8.")			[jre8]];
	};
	inherit config;
}
