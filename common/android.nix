{config, pkgs, util-lib, ...}:
let
	cfg = config.main.android;
in {
	options.main.android = with util-lib; {
		adb = mkOptOut "Install adb.";
		adb-rules = mkOptIn "Install only adb udev rules.";
	};
	config = util-lib.mkMerge [
		{
			_condition = cfg.adb;
			programs.adb.enable = true;
		}
		{
			_condition = cfg.adb-rules;
			services.udev.packages = with pkgs; [
				android-udev-rules
			];
		}
	];
}