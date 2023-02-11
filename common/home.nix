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
					"editor.codeLensFontFamily" = "'JetBrains Mono', 'Droid Sans Mono', 'monospace', monospace";
					"editor.fontFamily"			= "'JetBrains Mono', 'Droid Sans Mono', 'monospace', monospace";
					"editor.fontLigatures"		= true;
					"editor.inlayHints.enabled"	= "off";
					"editor.insertSpaces"		= false;
					"editor.detectIndentation"	= false;

					"workbench.iconTheme"		= "vscode-great-icons";
					"workbench.colorTheme"		= "GitHub Dark";
					"workbench.startupEditor"	= "none";

					"security.workspace.trust.untrustedFiles"	= "open";
					"security.workspace.trust.banner"			= "never";

					"rust-analyzer.rustc.source" = "/home/niki4tap/clones/rough-rust/Cargo.toml";

					"telemetry.telemetryLevel" = "off";
				};
				extensions = with vscode-extensions; [
					matklad.rust-analyzer
					tamasfe.even-better-toml
					github.github-vscode-theme
					editorconfig.editorconfig
					jnoortheen.nix-ide
					eamodio.gitlens
					emmanuelbeziat.vscode-great-icons
					usernamehw.errorlens
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
					substituteAllInPlace config.fish
				'';

				installPhase = ''
					mkdir $out
					cp colorize.py $out/colorize.py
					cp config.fish $out/config.fish
				'';
			};
		in "${prompt}/config.fish";

		# --- home manager stuff ---

		home.homeDirectory = "/home/niki4tap";
		home.stateVersion = "22.11";
	};
}
