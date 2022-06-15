{config, lib, pkgs, ...}:

{
	config = with lib; mkMerge [
		{
			time.timeZone = "Europe/Moscow";
			users = {
				defaultUserShell = pkgs.bash;
				users.niki4tap = {
					shell = pkgs.fish;
					extraGroups = ["wheel" "audio" "video"];
					isNormalUser = true;
					uid = 1000;
				};
				groups.niki4tap = {
					gid = 1000;
				};
			};
		}
		(mkIf (!config.main.hardware.homePartition) {
			users.users.niki4tap.createHome = true;
		})
	];
}