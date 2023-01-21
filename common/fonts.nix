{pkgs, ...}:

{
	fonts.fonts = with pkgs; [
		jetbrains-mono
		noto-fonts
		noto-fonts-emoji
		cascadia-code
	];
}
