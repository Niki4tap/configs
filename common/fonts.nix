{pkgs, ...}:

{
	fonts.fonts = with pkgs; [
		noto-fonts
		noto-fonts-emoji
		cascadia-code
	];
}
