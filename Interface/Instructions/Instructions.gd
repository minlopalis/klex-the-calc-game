extends Control

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("instructions"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused

func _on_Close_pressed():
	get_tree().paused = false
	visible = false
