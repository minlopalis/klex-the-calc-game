extends Control


func _ready():
	visible = false

func _process(_delta):
	if visible && Input.is_action_just_pressed("enter"):
		visible = false
		get_tree().paused = false


func show():
	visible = true
	get_tree().paused = true
