{config, pkgs, util-lib, ...}:

let
	cfg = config.main.rgb;
	openrgb-rules = builtins.readFile ../misc/60-openrgb.rules;
in {
	options.main.rgb = with util-lib; {
		openrgb = mkOptIn "Install openrgb."; # https://discourse.nixos.org/t/guide-to-setup-openrgb-on-nixos/9093
	};
	config = util-lib.mkMerge [
		{
			_condition = cfg.openrgb;
			environment.systemPackages = with pkgs; [openrgb];
			boot.kernelModules = ["i2c-dev" "i2c-piix4"];
			services.udev.extraRules = builtins.readFile openrgb-rules;
		}
	];
}
