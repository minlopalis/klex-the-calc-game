extends Node


func _ready():
	Gamestate.initalise_level()
	Gamestate.current_objective = "Find the screen"
	Gamestate.current_objective_icon = load("res://Items/Screen/screen64.png")
	Gamestate.has_screen = false # Klex will not have torch prior to this level
