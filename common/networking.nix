{config, lib, pkgs, util-lib, ...}:

let
	cfg = config.main.networking;
in {
	options.main.networking = with util-lib; {
		hostname = with lib; mkOption {
			description = "Hostname of the system.";
			default = "";
			type = types.str;
		};
		wifi = mkOptIn "Enable wifi and everything else for it to work.";
		nm = mkOptOut "Install network manager";
	};
	config = util-lib.mkMerge [
		{
			_condition = true;
			networking.hostName = builtins.seq (lib.assertMsg (cfg.hostname != "") "config.main.networking.hostname must be defined.") cfg.hostname;
			networking.hosts = {
				"127.0.0.1" = ["localhost"];
				"::1" = ["localhost"];
			};
			networking.nameservers = ["1.1.1.1" "8.8.8.8"];
		}

		{
			_condition = cfg.nm;
			networking.networkmanager.enable = true;
			networking.networkmanager.appendNameservers = ["1.1.1.1" "8.8.8.8"];
		}

		{
			_condition = cfg.wifi;
			networking = {
				dhcpcd.enable = true;
				firewall.enable = false;
				networkmanager = {
					dhcp = "dhcpcd";
				};
			};
		}
	];
}