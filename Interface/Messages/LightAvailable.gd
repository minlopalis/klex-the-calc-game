extends Control

func _ready():
	visible = false

func show_message():
	get_tree().paused = true
	visible = true
	

func _process(_delta):
	if Input.is_action_just_pressed("enter"):
		visible = false
		get_tree().paused = false
