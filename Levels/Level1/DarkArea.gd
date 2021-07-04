extends Area2D

onready var world_modulate = get_node("/root/Level1/WorldModulate")
onready var background_modulate = get_node("/root/Level1/Background/ParallaxLayer/BackgroundModulate")
onready var light_music = get_node("/root/Level1/Klex/LightMusic")
onready var dark_music = get_node("/root/Level1/Klex/DarkMusic")


var dark_color = Color("fa212121")


func _on_DarkArea_body_entered(body):
	world_modulate.color = dark_color
	background_modulate.color = dark_color
	
	light_music.playing = false
	dark_music.playing = true
