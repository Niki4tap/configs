{config, pkgs, util-lib, ...}:

let
	cnf-fix-sh = pkgs.writeShellScriptBin "cnf-fix" ''
 		sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos && sudo nix-channel --update
 	'';
 	omf-install-sh = pkgs.writeShellScriptBin "omf-install" ''
 		curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/v7/bin/install | fish
 	'';
in with util-lib; cfgDef {
	def_name = "main.fish";
	def = {
		fish = [(mkOptOut "Install fish shell.") {
			programs.fish.enable = true;
		}];
		omf = [(mkOptIn "Install oh my fish.") {
			environment.systemPackages = [
				omf-install-sh # Not using oh-my-fish package, it's broken
			];
		}];
		cnf-fix = [(mkOptOut "Make command-not-found fix script.") {
			environment.systemPackages = [
				cnf-fix-sh
			];
		}];
	};
	inherit config;
}
