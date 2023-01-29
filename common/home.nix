# TODO + FIXME + whatever else:
# SPLIT THIS UP
# !!!
# !!!

{pkgs, ...}: {
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

					"rust-analyzer.rustc.source" = "discover";

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
				];
			};
			command-not-found.enable = true;
		};

		xdg.configFile."fish/config.fish".source = ./../prompt/config.fish;

		# --- home manager stuff ---

		home.homeDirectory = "/home/niki4tap";
		home.stateVersion = "22.11";
	};
}
