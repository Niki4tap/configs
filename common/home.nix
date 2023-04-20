# TODO + FIXME + whatever else:
# SPLIT THIS UP
# !!!
# !!!

{pkgs, lib, ...}: {
	home-manager.users.niki4tap = {
		# --- email ---

		accounts.email.accounts.main = {
			address = "rombiklol2@gmail.com";
			primary = true;
		};

		# --- editorconfig ---

		editorconfig.enable = true;
		editorconfig.settings = {
			"*" = {
				end_of_line = "lf";
				insert_final_newline = true;
				indent_style = "tab";
				tab_width = 4;
				charset = "utf-8";
				trim_trailing_whitespace = true;
			};
		};

		programs = {
			chromium = {
				enable = true;
				extensions = [
					# Dark Reader
					{id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";}
					# Stylus
					{id = "clngdbkpkpeebahjckkjfobafhncgmne";}
					# React devtools
					{id = "fmkadmapgofadopljbjfkapdkoienihi";}
					# Espruino web IDE
					{id = "bleoifhkdalbjfbobjackfdifdneehpo";}
					# Refined GitHub
					{id = "hlepfoohegkhhmjieoechaddaejaokhf";}
					# uBlock Origin
					{id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
				];
			};
			vscode = with pkgs; {
				enable = true;
				package = vscode;
				userSettings = {
					"editor.codeLensFontFamily" = "'JetBrainsMono Nerd Font', 'Droid Sans Mono', 'monospace'";
					"editor.fontFamily"			= "'JetBrainsMono Nerd Font', 'Droid Sans Mono', 'monospace'";
					"editor.fontLigatures"		= true;
					"editor.inlayHints.enabled"	= "off";
					"editor.insertSpaces"		= false;
					"editor.detectIndentation"	= false;
					"editor.cursorBlinking"		= "phase";
					"editor.unicodeHighlight.allowedCharacters" = {
						"\u001b" = true;
					};

					"workbench.iconTheme"		= "vscode-great-icons";
					"workbench.colorTheme"		= "GitHub Dark";
					"workbench.startupEditor"	= "none";

					"security.workspace.trust.untrustedFiles"	= "open";
					"security.workspace.trust.banner"			= "never";

					"rust-analyzer.rustc.source" = "/home/niki4tap/clones/rough-rust/Cargo.toml";

					"telemetry.telemetryLevel" = "off";

					"errorLens.enabledDiagnosticLevels" = [
						"error"
						"warning"
						"info"
						"hint"
					];
				};
				extensions = with vscode-extensions; [
					matklad.rust-analyzer
					tamasfe.even-better-toml
					github.github-vscode-theme
					editorconfig.editorconfig
					jnoortheen.nix-ide
					# Pin gitlens since it dies every update
					(pkgs.vscode-utils.buildVscodeMarketplaceExtension {
						mktplcRef = {
							publisher = "eamodio";
							name = "gitlens";
							version = "13.3.0";
							sha256 = "QQ2pFbglSuXZjubwbVgn+N47s66lFs9YgzGfWPejVw8=";
						};
						meta = {
							license = lib.licenses.mit;
						};
					})
					emmanuelbeziat.vscode-great-icons
					usernamehw.errorlens
					ritwickdey.liveserver
					# ANSI Colors
					(pkgs.vscode-utils.buildVscodeMarketplaceExtension {
						mktplcRef = {
							publisher = "iliazeus";
							name = "vscode-ansi";
							version = "1.1.2";
							sha256 = "sQfaykUy3bqL2QFicxR6fyZQtOXtL/BqV0dbAPMh+lA=";
						};
						meta = {
							license = lib.licenses.mit;
						};
					})
				];
			};
			command-not-found.enable = true;
		};

		xdg.configFile."fish/config.fish".source = let
			prompt = pkgs.stdenv.mkDerivation {
				name = "fish_prompt";

				src = ./../prompt;

				buildPhase = ''
					export vscode=${pkgs.vscode}
					export python=${pkgs.python310}
					export any_nix_shell=${pkgs.any-nix-shell}
					substituteAllInPlace config.fish
				'';

				installPhase = ''
					mkdir $out
					cp * $out/
				'';
			};
		in "${prompt}/config.fish";

		# --- home manager stuff ---

		home.homeDirectory = "/home/niki4tap";
		home.stateVersion = "22.11";
	};
}
