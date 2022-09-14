# Created by Andrew Bevilacqua
# Last updated 08/16/2022 @ 08/16/2022 @ 6:48 PDT
# Main script for Yahtzee game in Godot

extends Node

# declaration of global variables
var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var diceValues = [1,1,1,1,1]
var locked = [false,false,false,false,false]
var score: int

# main function that begins when roll button is pressed
# plays die audio(waits 1sec for audio to complete)
# obtains lock information
# calculates/sets dice values
# calculates score
func _on_rollButton_pressed():
	_play_audio()
	yield(get_tree().create_timer(2), "timeout") 
	_get_diceLock()
	_calc_diceValues()
	_set_diceValues()
	_calc_Score()

# plays audio of die being thrown and die being rolled
func _play_audio():
	rng.randomize()
	get_node("rollAudio").play()
	yield(get_tree().create_timer(1.6), "timeout")
	get_node("throwAudio").stream = load("res://Sounds/dieThrow"+str(rng.randi_range(1,2))+".ogg")
	get_node("throwAudio").play()
	
# gets locked boolean from dice nodes
func _get_diceLock():
	for n in range(len(diceValues)):
		locked[n] = get_node("dice" + str(n)).get_diceLock()

# randomly selects 5 die values given a selected die is not locked
# if die is locked previous dice values is reused
func _calc_diceValues():
	for n in range(len(diceValues)):
		if locked[n] == false:
			rng.randomize()
			diceValues[n] = rng.randi_range(1,6)

# sends dice values to die nodes to select proper texture to display to user
func _set_diceValues():
	for n in range(len(diceValues)):
		get_node("dice" + str(n)).set_diceValue(diceValues[n])

# calculates sum of dice rolled and sends to score and score patterns to output proper message
func _calc_Score():
	score = 0
	for n in range(len(diceValues)):
		score += diceValues[n]
	get_node("score").updateScore(score)
	get_node("scorePatterns").calc_Patterns(diceValues)
