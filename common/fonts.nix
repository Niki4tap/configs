{pkgs, ...}:

{
	fonts.fonts = with pkgs; [
		nerdfonts
		noto-fonts
		noto-fonts-emoji
	];
}
