{config, lib, pkgs, util-lib, ...}:

let
	cfg = config.main.xorg;
in {
	options.main.xorg = with lib; {
		dm = mkOption {
			type = types.enum ["none" "gdm" "sddm"];
			description = "Display manager.";
			default = "none";
		};
		de = mkOption {
			type = types.enum ["none" "gnome" "kde"];
			description = "Desktop environment.";
			default = "none";
		};
	};
	config = util-lib.mkMerge [
		{
			_condition = (config.main.nvidia.mode != "none");
			services.xserver.videoDrivers = ["nvidia"];
		}

		{
			_condition = ((cfg.dm != "none") || (cfg.de != "none"));
			services.xserver.enable = true;
		}

		{
			_condition = (cfg.dm == "gdm");
			services.xserver.displayManager.gdm = {
				enable = true;
				wayland = false;
				debug = true;
			};
		}

		{
			_condition = (cfg.dm == "sddm");
			services.xserver.displayManager.sddm.enable = true;
		}

		{
			_condition = (cfg.de == "gnome");
			services.xserver.desktopManager.gnome = {
				enable = true;
				debug = true;
			};
			environment.systemPackages = [ pkgs.konsole ];
			environment.gnome.excludePackages = (with pkgs; [
				gnome-photos
				gnome-tour
			]) ++ (with pkgs.gnome; [
				gnome-terminal
				cheese
				gnome-music
				gedit
				epiphany
				geary
				evince
				gnome-characters
				totem
				tali
				iagno
				hitori
				atomix
			]);
		}

		{
			_condition = (cfg.de == "kde");
			services.xserver.desktopManager.plasma5.enable = true;
		}
	];
}
