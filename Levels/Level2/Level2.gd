extends Node


func _ready():
	Gamestate.initalise_level()
	Gamestate.current_objective = "Find a logic board"
	Gamestate.current_objective_icon = load("res://Items/LogicBoard/logicbgoard64.png")
	Gamestate.current_level = 2
	Gamestate.has_screen = true
	Gamestate.can_exit = false
