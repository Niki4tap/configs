{config, lib, pkgs, util-lib, ...}:

let
	cfg = config.main.ssh;
in {
	options.main.ssh = with util-lib; {
		install = mkOptOut "Install sshd.";
		enable = mkOptOut "Enable sshd.";
	};
	config = util-lib.mkMerge [
		{
			_condition = cfg.install;
			services.openssh.enable = true;
			services.sshd.enable = true;
		}

		{
			_condition = (cfg.install && cfg.enable);
			systemd.services.sshd.wantedBy = lib.mkOverride 40 [ "multi-user.target" ];
		}
	];
}