{lib, ...}@inputs:

{
	# Basically a bit more flexible copy of pkgDef
	cfgDef = {def_name, def, config}: with lib;
		(setAttrByPath
			(["options"] ++ (splitString "." def_name))
			(genAttrs (builtins.attrNames def) (name: (builtins.elemAt (builtins.getAttr name def) 0)))
		//
		{config =
		((import ./merge.nix inputs).mkMerge (imap0 
			(i: part:
				part //
				(
					let
						cond = attrByPath ((splitString "." def_name) ++ [(builtins.elemAt (builtins.attrNames def) i)]) null config;
						conds = (if part ? _extra_conditions then part._extra_conditions else []);
					in {
						_condition = all (val: val) ([cond] ++ conds);
					}
				)
			)
			(map (name: (builtins.elemAt (builtins.getAttr name def) 1)) (builtins.attrNames def)))
		);}
	);
}