{config, lib, pkgs, ...}:

{
	main = {
		networking = {
			nm = true;
			hostname = "nixos-desktop";
		};
	};
}
