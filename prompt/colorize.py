import re
import sys
import math

# Discord ansi colors
# Manually extracted through devtools
# (3bit => "small")
# see: https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
# discord specifically does not support bright colors
# but does support background ones
# which this tool does not yet convert :p
discord_ansi_small_color_table = {
	30: (79, 84, 92),
	31: (220, 50, 47),
	32: (133, 153, 0),
	33: (181, 137, 0),
	34: (38, 139, 210),
	35: (211, 54, 130),
	36: (42, 161, 152),
	37: (255, 255, 255)
}

# part1 of 8bit colors, 3bit colors
ansi_8bit_color_table_part1 = dict(map(lambda t: (t[0]-30, t[1]), list(discord_ansi_small_color_table.items())))

# part2 of 8bit colors, 4bit colors
# WARNING:
# This color table is not from discord
# since, discord, you know, doesn't support bright (4bit) colors
# so we'll have to take something else that implements them.
# I've decided to choose vscode's colors
#
# also, WARNING:
# keys lie here,
# they are not correct,
# on purpose, of course
# since this table is only used in `ansi_8bit_color_to_rgb`
# so keys are from 8bit color sequences,
# not 4bit ones
ansi_8bit_color_table_part2 = {
	8:  (102, 102, 102),
	9:  (241, 76, 76),
	10: (35, 209, 139),
	11: (245, 245, 67),
	12: (59, 142, 234),
	13: (214, 112, 214),
	14: (41, 184, 219),
	15: (229, 229, 229)
}

# This will be populated later
ansi_8bit_color_table = {}

ansi_8bit_color_table.update(ansi_8bit_color_table_part1)
ansi_8bit_color_table.update(ansi_8bit_color_table_part2)

# part3
# the 6x6x6 color cube
# sorry for awful nesting/indenting in advance :v
for red in range(0, 6):
	for green in range(0, 6):
		for blue in range(0, 6):
			ansi_8bit_color_table[
				16 +
				(red * 36) +
				(green * 6) +
				blue
			] = (
				(red * 40 + 55 if red != 0 else 0),
				(green * 40 + 55 if green != 0 else 0),
				(blue * 40 + 55 if blue != 0 else 0)
			)

with open(sys.argv[1], "r+") as f:
	txt = f.read()
	f.seek(0)
	f.truncate()
	new_txt = "```ansi\n"
	new_txt += txt
	regex = re.compile("\[(?P<seq>\d+);5;(?P<color>\d+)m")
	for match in regex.finditer(txt):
		seq = int(match.group(1))
		if not (seq in range(30, 39)):
			continue
		(r, g, b) = ansi_8bit_color_table[int(match.group(2))]
		lowest_distance = 1000000 # this should always be changed, so I hope this value will work well enough
		new_code = 0 # same as previous line
		for ansi_code, (r2, g2, b2) in discord_ansi_small_color_table.items():
			# https://en.wikipedia.org/wiki/Color_difference#sRGB
			distance = math.sqrt(((r2 - r) ** 2 + (g2 - g) ** 2 + (b2 - b) ** 2))
			if lowest_distance > distance:
				lowest_distance = distance
				new_code = ansi_code
		new_txt = new_txt.replace(match.group(0), f"[{new_code}m")
	new_txt += "\n```"
	f.write(new_txt)
