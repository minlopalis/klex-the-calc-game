extends Control

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("enter") && visible == true:
		get_tree().paused = !get_tree().paused
		Gamestate.next_level()

func show():
	visible = true
