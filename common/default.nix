{nixpkgs, rust-overlay, hm, ...}:

{
	imports = [
		(import "${hm}/nixos")
		./home.nix
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
		./misc.nix
		./env.nix
		./python.nix
		./android.nix
		./rgb.nix
	];
	nixpkgs.overlays = [rust-overlay.overlays.default];
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "22.11";
}
