{
	description = "Flake that describes my systems";

	inputs = {
		nixos-unstable.url = github:NixOS/nixpkgs/nixos-unstable;
		rust-overlay.url = github:oxalica/rust-overlay;
		rust-overlay.inputs.nixpkgs.follows = "nixos-unstable";
		home-manager.url = github:nix-community/home-manager;
		home-manager.inputs.nixpkgs.follows = "nixos-unstable";
		rough-rust = {
			flake = false;
			url = "https://github.com/rust-lang/rust.git";
			type = "git";
			submodules = true;
		};
	};

	outputs = {
		self,
		nixos-unstable,
		rust-overlay,
		home-manager,
		rough-rust
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

					specialArgs = {
						util-lib = import ./util {pkgs = pkgs-unstable; lib = lib-unstable;};
						rust-overlay = rust-overlay;
						hm = home-manager;
						inherit rough-rust;
					};
					modules = [
						./common
						./systems/main-desktop.nix
					];
				};
				nixos-laptop = nixos {
					inherit system;

					specialArgs = {
						util-lib = import ./util {pkgs = pkgs-unstable; lib = lib-unstable;};
						rust-overlay = rust-overlay;
						hm = home-manager;
						inherit rough-rust;
					};
					modules = [
						./common
						./systems/laptop.nix
					];
				};
			};
		}
	);
}
