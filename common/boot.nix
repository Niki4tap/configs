{config, util-lib, ...}:

util-lib.mkMerge [
	{
		_condition = true;
		boot = {
			cleanTmpDir = true;
#			crashDump.enable = true; # If you enable this, you die (this patches the kernel and results in 100% cache miss)
			supportedFilesystems = ["fat"];
			initrd = {
				enable = true;
				network.enable = true;
				verbose = true;
			};
			loader = {
				efi.efiSysMountPoint = "/boot"; # Only efi is supported atm, but I have plans on supporting bios too (shouldn't be hard (famous last words)).
				efi.canTouchEfiVariables = true; # Until I need bios, it will be efi-only I guess.
				grub = {
					enable = true;
					copyKernels = true;
					device = "nodev";
					efiSupport = true;
					fsIdentifier = "label";
					version = 2;
				};
			};
		};
	}

	{
		_condition = config.main.nvidia.sync-external-display;
		boot.loader.grub.default = 1;
	}
]
