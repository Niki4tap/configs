{
	description = "Flake that describes my systems";

	inputs = {
		nixos-unstable.url = github:NixOS/nixpkgs/nixos-unstable;
		rust-overlay.url = github:oxalica/rust-overlay;
	};

	outputs = {
		self,
		nixos-unstable,
		rust-overlay
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

					# afaik `specialArgs` is deprecated, but I can't use `_module.args` here for some reason?
					specialArgs.util-lib = import ./util {pkgs = pkgs-unstable; lib = lib-unstable;};
					modules = [
						./common
						./systems/main-desktop.nix
					];
				};
				nixos-laptop = nixos {
					inherit system;

					specialArgs.util-lib = import ./util {pkgs = pkgs-unstable; lib = lib-unstable;};
					modules = [
						./common
						./systems/laptop.nix
					];
				};
			};
		}
	);
}
