{...}:

{
	imports = [
		./users-groups.nix
		./communication.nix
		./hardware.nix
		./boot.nix
		./fish.nix
		./shellUtils.nix
		./networking.nix
		./lang.nix
		./games.nix
		./nvidia.nix
		./nix.nix
		./ssh.nix
		./xorg.nix
		./editors.nix
		./fonts.nix
	];
	system.stateVersion = "22.11";
}