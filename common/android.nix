{config, pkgs, util-lib, ...}:

with util-lib; cfgDef {
	def_name = "main.android";
	def = {
		adb = [(mkOptOut "Install adb.") {
			programs.adb.enable = true;
		}];
		adb-rules = [(mkOptIn "Install only adb udev rules.") {
			services.udev.packages = with pkgs; [
				android-udev-rules
			];
		}];
	};
	inherit config;
}