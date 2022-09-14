# Created by Andrew Bevilacqua
# Last updated 08/16/2022 @ 08/16/2022 @ 6:30 PDT
# Dice script for Yahtzee game in Godot
# Used in all die nodes

extends Sprite

# declaration of global variables
var locked = false
var _dice_img = load("res://Images/dieWhite1.png")
var _diceValue: int

# function used to initialize textures, die lock, and die value
func _ready():
	locked = false
	_diceValue = 1
	texture = _dice_img

# runs when a die is pressed, locks the die and changes image to represent locked die
func _on_diceLock_pressed():
	if locked == false:
		locked = true
		texture = load("res://Images/dieWhite_border" + str(_diceValue) + ".png")
	else:
		locked = false
		texture = load("res://Images/dieWhite"+ str(_diceValue) +".png")

# returns boolen stating if die is locked
func get_diceLock():
	return locked

# updates image of die to represent the new die value calculated
func set_diceValue(diceValue):
	_diceValue = diceValue
	if locked == false:
		texture = load("res://Images/dieWhite"+ str(diceValue) +".png")
	else:
		texture = load("res://Images/dieWhite_border" + str(diceValue) + ".png")
