extends Node

var color_white = Color( 1, 1, 1, 1 )

onready var world_modulation = $WorldModulate
onready var background_modulation = $Background/ParallaxLayer/BackgroundModulate


func _ready():
	Gamestate.initalise_level()
	Gamestate.current_objective = "Find the screen"
	Gamestate.current_objective_icon = load("res://Items/Screen/screen64.png")
	Gamestate.has_screen = false # Klex will not have torch prior to this level
	Gamestate.current_level = 1
	Gamestate.can_exit = false
	set_color_modulation(color_white)


func set_color_modulation(color):
	world_modulation.color = color
	background_modulation.color = color
