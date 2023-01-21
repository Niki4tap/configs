{
	description = "Flake that describes my systems";

	inputs = {
		nixos-unstable.url = github:NixOS/nixpkgs/nixos-unstable;
		rust-overlay.url = github:oxalica/rust-overlay;
		rust-overlay.inputs.nixpkgs.follows = "nixos-unstable";
		home-manager.url = github:nix-community/home-manager;
		home-manager.inputs.nixpkgs.follows = "nixos-unstable";
	};

	outputs = {
		self,
		nixos-unstable,
		rust-overlay,
		home-manager
	}@inputs:(
		let
			system = "x86_64-linux";
			pkgs-unstable = import nixos-unstable {
				inherit system;
				config = {
					allowUnfree = true;
				};
			};
			lib-unstable = pkgs-unstable.lib;
			nixos = nixos-unstable.lib.nixosSystem;
		in {
			nixosConfigurations = {
				main-desktop = nixos {
					inherit system;

					specialArgs.util-lib = import ./util {pkgs = pkgs-unstable; lib = lib-unstable;};
					specialArgs.rust-overlay = rust-overlay;
					specialArgs.hm = home-manager;
					modules = [
						./common
						./systems/main-desktop.nix
					];
				};
				nixos-laptop = nixos {
					inherit system;

					specialArgs.util-lib = import ./util {pkgs = pkgs-unstable; lib = lib-unstable;};
					specialArgs.rust-overlay = rust-overlay;
					specialArgs.hm = home-manager;
					modules = [
						./common
						./systems/laptop.nix
					];
				};
			};
		}
	);
}
