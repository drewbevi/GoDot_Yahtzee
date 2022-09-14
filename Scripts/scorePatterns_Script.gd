# Created by Andrew Bevilacqua
# Last updated 08/16/2022 @ 08/16/2022 @ 6:40 PDT
# Score pattern script for Yahtzee game in Godot

extends RichTextLabel

# given dice values, determine what(if any) pattern occur
# utilizes .count() to determine matching values
func calc_Patterns(diceValues):
	bbcode_enabled = true
	var count = []
	for x in diceValues:
		count.append(diceValues.count(x))
	if 2 in count and 3 in count:
		clear()
		set_bbcode("[right] Full House [/right]")
	elif 2 in count:
		clear()
		set_bbcode("[right]2 of a kind [/right]")
	elif 3 in count:
		clear()
		set_bbcode("[right]3 of a kind [/right]")
	elif 4 in count:
		clear()
		set_bbcode("[right]4 of a kind [/right]")
	elif 5 in count:
		clear()
		set_bbcode("[right]GODOTZY! [/right]")
	elif 2 in diceValues and 3 in diceValues and 4 in diceValues and 5 in diceValues and 6 in diceValues:
		clear()
		set_bbcode("[right]Large Straight [/right]")
	elif 1 in diceValues and 2 in diceValues and 3 in diceValues and 4 in diceValues and 5 in diceValues:
		clear()
		set_bbcode("[right]Small Straight [/right]")
	else:
		clear()
		add_text(" ")
