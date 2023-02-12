{config, lib, pkgs, util-lib, ...}:

let
	cfg = config.main.nix;
in {
	options.main.nix = with lib; {
		flakes = util-lib.mkOptOut "Enable experimental flake support.";
		alternative-shell = mkOption {
			type = types.enum ["none" "zsh" "fish"];
			description = "Use alternative nix-shell";
			default = "none";
		};
	};
	config = util-lib.mkMerge [
		{
			_condition = cfg.flakes;
			nix = {
				package = pkgs.nixFlakes;
				extraOptions = ''
					experimental-features = nix-command flakes
				'';
			};
		}
		{
			_condition = (cfg.alternative-shell != "none");
			environment.systemPackages = with pkgs; [
				any-nix-shell
			];
		}
		{
			_condition = (cfg.alternative-shell == "fish"); # zsh support is coming when I need it
			environment.systemPackages = with pkgs; [
				any-nix-shell
			];
		}
	];
}
