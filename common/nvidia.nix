{config, lib, pkgs, util-lib, ...}:

let
	cfg = config.main.nvidia;
	nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
		export __NV_PRIME_RENDER_OFFLOAD=1
		export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
		export __GLX_VENDOR_LIBRARY_NAME=nvidia
		export __VK_LAYER_NV_optimus=NVIDIA_only
		exec -a "$0" "$@"
	'';
in {
	options.main.nvidia = with lib; {
		mode = mkOption {
			type = types.enum ["none" "offload" "sync"];
			description = "Nvidia mode, see https://nixos.wiki/wiki/Nvidia for more info.";
			default = "none";
		};
		sync-external-display = mkOption {
			type = types.bool;
			description = "Enable sync external display.";
			default = false;
		};
		nvidiaBusId = mkOption {
			type = types.string;
			description = "Nvidia bus id, do `lspci` to figure it out";
			default = "";
		};
		intelBusId = mkOption {
			type = types.string;
			description = "Intel bus id, do `lspci` to figure it out";
			default = "";
		};
	};
	config = with util-lib; mkMerge [
		{
			_condition = (cfg.nvidia == "offload");
			environment.systemPackages = [
				nvidia-offload
			];
			hardware.nvidia.prime = {
				offload.enable = true;
				intelBusId = assertNotEmptyMsg cfg.intelBusId "intelBusId is empty.";
				nvidiaBusId = assertNotEmptyMsg cfg.nvidiaBusId "nvidiaBusId is empty.";
			};
		}

		{
			_condition = (cfg.nvidia == "sync");
			hardware.nvidia.prime = {
				sync.enable = true;
				intelBusId = assertNotEmptyMsg cfg.intelBusId "intelBusId is empty.";
				nvidiaBusId = assertNotEmptyMsg cfg.nvidiaBusId "nvidiaBusId is empty.";
			};
		}

		{
			_condition = cfg.sync-external-display;
			specialisation = {
				external-display.configuration = {
					system.nixos.tags = [ "external-display" ];
					hardware.nvidia.prime.offload.enable = pkgs.lib.mkForce false;
					hardware.nvidia.powerManagement.enable = pkgs.lib.mkForce false;
				};
			};
		}
	];
}