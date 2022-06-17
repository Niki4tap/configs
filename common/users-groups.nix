{config, pkgs, util-lib, ...}:

{
	config = with util-lib; mkMerge [
		{
			_condition = true;
			time.timeZone = "Europe/Moscow";
			users = {
				defaultUserShell = pkgs.bash;
				users.niki4tap = {
					extraGroups = ["wheel" "audio" "video"];
					isNormalUser = true;
					uid = 1000;
				};
				groups.niki4tap = {
					gid = 1000;
				};
			};
		}

		{
			_condition = (!config.main.hardware.homePartition);
			users.users.niki4tap.createHome = true;
		}

		{
			_condition = (config.main.fish.fish);
			users.users.niki4tap.shell = pkgs.fish;
		}
	];
}
