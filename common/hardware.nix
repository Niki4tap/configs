{config, lib, pkgs, util-lib, ...}:
let
	cfg = config.main.hardware;
in {
	options.main.hardware = with util-lib; {
		homePartition = mkOptOut "Use home partition.";
		opengl = mkOptOut "Install opengl.";
	};
	config = util-lib.mkMerge [
		{
			_condition = true;
			hardware.enableAllFirmware = true;
		}

		{
			_condition = cfg.opengl;
			hardware.opengl.enable = true;
		}

		{
			_condition = cfg.homePartition;
			fileSystems = {
				"/home" = {
					device = "/dev/disk/by-label/nixos_home";
					fsType = "ext4";
					autoResize = true;
				};
			};
		}

		{
			_condition = true;
			fileSystems = {
				"/" = {
					device = "/dev/disk/by-label/nixos_root";
					fsType = "ext4";
				};
				"/boot" = {
					device = "/dev/disk/by-label/nixos_boot";
					fsType = "vfat";
					noCheck = true;
				};
			};
		}
	];
}
