{config, pkgs, util-lib, ...}:
let
	cfg = config.main.python;
	py_enabled = config.main.lang.python;
	# Look, it's my first derivation EVER, I have little to no clue how to write those things, so here you go:
	actually-additions = with pkgs; stdenv.mkDerivation rec {
		name = "Interactive-additions";
		unpackPhase = "true";
		buildPhase = "true";

		propagatedBuildInputs = [python310Packages.forbiddenfruit];
		src = fetchFromGitHub {
			owner = "Niki4tap";
			repo = name;
			rev = "7dbe305c0127aa495b1b9ecb52e64440358e059f";
			sha256 = "1m4sh0zs46fhlxa1vsrwdl2q91dar7l5akk7rcza776v3qv69wyz";
		};
		installPhase = ''
mkdir -p $out/bin
mkdir $out/interactive_additions
cp -r $src/* $out/interactive_additions

cat <<EOF > $out/bin/python
#!/usr/bin/env bash
PYTHONPATH="$PYTHONPATH:$out" ${python310}/bin/python -i -m interactive_additions
EOF

chmod +x $out/bin/python
		'';
	};
in {
	options.main.python = with util-lib; {
		interactive_additions = mkOptOut "Enable interactive additions.";
	};
	config = util-lib.mkMerge [
		{
			_condition = (py_enabled && cfg.interactive_additions);
			environment.systemPackages = [actually-additions];
		}
	];
}
