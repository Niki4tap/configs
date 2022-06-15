{config, lib, pkgs, util-lib, ...}:

let
	cfg = config.main.fish;
	cnf-fix-sh = pkgs.writeShellScriptBin "cnf-fix" ''
		sudo -s nix-channel --add https://nixos.org/channels/nixos-unstable nixos && nix-channel --update
	'';
in {
	options.main.fish = with util-lib; {
		fish = mkOptOut "Install fish shell.";
		omf = mkOptIn "Install oh my fish.";
		cnf-fix = mkOptOut "Make command-not-found fix script.";
	};
	config = util-lib.mkMerge [
		{
			_condition = cfg.fish;
			programs.fish.enable = true;
		}

		{
			_condition = cfg.omf;
			environment.systemPackages = with pkgs; [
				oh-my-fish
			];
		}

		{
			_condition = cfg.cnf-fix;
			environment.systemPackages = with pkgs; [
				cnf-fix-sh
			];
		}
	];
}