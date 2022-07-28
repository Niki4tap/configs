{config, pkgs, util-lib, ...}:

let
	cfg = config.main.rgb;
	openrgb-rules = builtins.fetchurl {
		url = "https://gitlab.com/CalcProgrammer1/OpenRGB/-/jobs/2762976628/artifacts/raw/60-openrgb.rules?inline=false";
		sha256 = "1s3dk80yf0j86sl4ijcbsc7pvfsvcsw5d5adhfjaplghn9n5lgi2";
	};
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
