{config, pkgs, util-lib, ...}:

let
	cfg = config.main.fish;
	cnf-fix-sh = pkgs.writeShellScriptBin "cnf-fix" ''
		sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos && sudo nix-channel --update
	'';
	omf-install-sh = pkgs.writeShellScriptBin "omf-install" ''
		curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/v7/bin/install | fish
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
				omf-install-sh # Not using oh-my-fish package, it's broken
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
