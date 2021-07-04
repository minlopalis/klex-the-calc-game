extends Area2D


onready var animated_sprite = $AnimatedSprite
onready var animation_player = $AnimationPlayer

onready var level1_message = $Messages/Level1
onready var level2_message = $Messages/Level2

func _ready():
	pass


func _on_Doc_body_entered(body):
	animation_player.stop(false)
	animated_sprite.animation = "idle"
	show_message(Gamestate.current_level)


func _on_Doc_body_exited(body):
	animated_sprite.animation = "walk"
	show_message(Gamestate.current_level)
	animation_player.play()


func show_message(level):
	if level == 1:
		level1_message.visible = !level1_message.visible
	if level == 2 && Gamestate.has_logic_board == false:
		level2_message.visible = !level2_message.visible
