{...}@inputs:

let
	merge = import ./merge.nix inputs;
	options = import ./options.nix inputs;
	pkg_def = import ./pkgDef.nix inputs;
	cfg_def = import ./cfgDef.nix inputs;
	assertions = import ./assertions.nix inputs;
in
	merge //
	options //
	pkg_def //
	cfg_def //
	assertions //
	{
		inherit
		merge
		options
		pkg_def
		cfg_def
		assertions;
	}