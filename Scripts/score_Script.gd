# Created by Andrew Bevilacqua
# Last updated 08/16/2022 @ 08/16/2022 @ 6:30 PDT
# Score script for Yahtzee game in Godot

extends RichTextLabel

# used to updated score given dice sum calculated in Main_script
func updateScore(diceSum):
	clear()
	add_text("- Score: " + str(diceSum))
