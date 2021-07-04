# ganestate.gd

extends Node

signal player_dead

var world_limit = 5000
var lives = 3
var battery_life = 100
var coins = 0
var current_level = 0
var game_over = false
var can_exit = false # Can the player exit the level
var has_screen = false # has the player collected the screen thus enabling the light
var has_logic_board = false # has the player collected the logic board thus enabling the calculator
var current_objective = null
var current_objective_icon = null
var current_level_attempts = 0 # number of attempts to complete level
var start_coins # number of coins at the start of the level
var start_battery_life # battery life at the start of the level



func _process(_delta):
	check_battery_life()
	game_over()
	quit()


func new_game():
	#Initialise Variables
	world_limit = 5000
	lives = 3
	battery_life = 100
	coins = 0
	current_level = 0
	game_over = false
	can_exit = false # Can the player exit the level
	has_screen = false # has the player collected the screen thus enabling the light
	has_logic_board = false # has the player collected the logic board thus enabling the calculator
	current_objective = null
	current_objective_icon = null
	current_level_attempts = 0 # number of attempts to complete level
	start_coins = coins # number of coins at the start of the level
	start_battery_life = battery_life # battery life at the start of the level
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")


func next_level():
	print("next level ran")
	start_coins = coins
	start_battery_life = battery_life
	load_level(current_level + 1)


func initalise_level():
	if current_level_attempts == 0:
		start_coins = coins
		start_battery_life = 100
	else: 
		coins = start_coins
		battery_life = start_battery_life
		current_level_attempts += 1
	
	can_exit = false
	game_over = false
	get_tree().paused = false


func drain_battery(amount):
	battery_life -= amount


func check_battery_life():
	if battery_life <= 0 && lives >= 0:
		emit_signal("player_dead")


func restart_level():
		current_level_attempts += 1
		lives -= 1
		initalise_level()
		load_level(current_level)
		get_tree().paused = false


func load_level(level):
	get_tree().change_scene("res://Levels/Level" + str(level) + "/Level" + str(level) + ".tscn")


func game_over():
	if lives < 0 and game_over == false:
		game_over = true
		get_tree().change_scene("res://Interface/GameOver/GameOver.tscn")
		get_tree().paused = false
		yield(get_tree(), "idle_frame")


func quit():
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
