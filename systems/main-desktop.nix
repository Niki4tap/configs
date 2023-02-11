{config, lib, pkgs, ...}:

{
	main = {
		communication = {
			discord = true;
			irc = true;
		};
		networking = {
			nm = true;
			hostname = "nixos-desktop";
		};
		editors.kdenlive = true;
		fish = {
			fish = true;
			omf = true;
			cnf-fix = true;
		};
		games.minecraft = true;
		lang = {
			llvm_extra = true;
			gcc = false;
			clang = true;
			python = true;
			python_extra = true;
			rust-minimal = false;
			rust-full = true;
			java8 = true;
		};
		nix.flakes = true;
		nix.alternative-shell = "fish";
		env.direnv = true;
		nvidia = {
			mode = "sync";
			sync-external-display = true;
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
		shellUtils = {
			cool_looking = true;
			basics = true;
			git = true;
			earlyoom = true;
			xclip = true;
			ffmpeg = true;
			nmap = true;
			dig = true;
			htop = true;
			bpytop = true;
			tmux = true;
			screen = false;
		};
		xorg.dm = "gdm";
		xorg.de = "gnome";
		rgb.openrgb = true;
	};
}
