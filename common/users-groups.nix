{config, pkgs, util-lib, rough-rust, ...}:

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
			system.userActivationScripts.clone-rough-rust.text = ''
				if [[ $EUID != 1000 ]] then
					exit
				fi
				if [[ -d "/home/niki4tap/clones/rough-rust" ]] then
					chmod -R 777 /home/niki4tap/clones/rough-rust
					rm -rf /home/niki4tap/clones/rough-rust
				fi
				mkdir -p /home/niki4tap/clones/rough-rust
				cp -r ${rough-rust}/* /home/niki4tap/clones/rough-rust/
				chmod 755 /home/niki4tap/clones/rough-rust
				chmod -R 555 /home/niki4tap/clones/rough-rust/*
			'';
		}
		{
			_condition = (!config.main.hardware.homePartition);
			users.users.niki4tap.createHome = true;
		}
		{
			_condition = (config.main.fish.fish);
			users.users.niki4tap.shell = pkgs.fish;
		}
		{
			_condition = (config.main.android.adb);
			users.users.niki4tap.extraGroups = ["adbusers"];
		}
		{
			_condition = true;
			environment.shellAliases = {
				redirect = "curl -LsI -o /dev/null -w '%{url_effective}\n'";
			};
		}
	];
}
