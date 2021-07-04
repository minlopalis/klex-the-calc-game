# LevelFailed.gd

extends Control



func _ready():
	visible = false
	Gamestate.connect("player_dead", self, "show")


func _process(_delta):
	if visible && Input.is_action_just_pressed("enter"):
		visible = false
		Gamestate.restart_level()


func show():
	visible = true
