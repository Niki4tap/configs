{config, lib, pkgs, ...}:

{
	boot = {
		cleanTmpDir = true;
		crashDump.enable = true;
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