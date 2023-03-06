{config, lib, pkgs, ...}:

{
	main = {
		communication = {
			discord = true;
			irc = true;
		};
		fish = {
			fish = true;
			omf = true;
			cnf-fix = true;
		};
		lang = {
			llvm_extra = true;
			gcc = false;
			clang = true;
			python = true;
			python_extra = true;
			rust-minimal = true;
			java8 = false;
		};
		networking = {
			hostname = "nixos-laptop";
			wifi = true;
			nm = true;
		};
		nix.flakes = true;
		shellUtils = {
			xclip = true;
			ffmpeg = true;
			htop = true;
			bpytop = true;
		};
		ssh.enable = false;
		xorg = {
			dm = "gdm";
			de = "gnome";
		};
	};
}
