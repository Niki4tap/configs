{lib, ...}@inputs:


{
	# I spent around half a day on this function, I'm not touch it, nor do I want to comment it, it's a mess - just use it
	pkgDef = {def_name, def}: with lib;
		(setAttrByPath
			(["options"] ++ (splitString "." def_name))
			(genAttrs (builtins.attrNames def) (name: (builtins.elemAt (builtins.getAttr name def) 0)))
		//
		{config =
		((import ./merge.nix inputs).mkMerge (imap0 
			(i: names:
				{
					environment.systemPackages = names;
					_condition = getAttrByPath (["config"] ++ (splitString "." def_name) ++ [(builtins.getAttr (builtins.elemAt (builtins.attrNames def) i) def)]);
				}
			)
			(map (name: (builtins.elemAt (builtins.getAttr name def) 1)) (builtins.attrNames def)))
		);}
	);
}