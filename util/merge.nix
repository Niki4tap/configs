{lib, ...}:

{
	mkMerge = with lib; toMerge: lib.mkMerge (
		map 
			(elem: lib.mkIf
				(if elem ? _condition then elem._condition else 
				(builtins.trace "util-lib.mkMerge:\nFollowing attrset doesn't have `_condition`, assuming true, but should be present!"
				(builtins.trace elem true
				))) (removeAttrs elem ["_condition"])
			)
			toMerge
	);
}