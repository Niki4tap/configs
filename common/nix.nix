{config, lib, pkgs, util-lib, ...}:

let
	cfg = config.main.nix;
in {
	options.main.nix = with util-lib; {
		flakes = mkOptOut "Enable experimental flake support.";
	};
	config = {
		nix = let
			nix = pkgs.nixFlakes;
		in {
			package = nix;
			extraOptions = ''
				experimental-features = nix-command flakes
			'';
		};
	};
}