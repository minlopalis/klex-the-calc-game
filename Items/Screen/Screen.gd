extends Area2D


func _on_Screen_body_entered(body):
	$AnimationPlayer.play("die")
	Gamestate.current_objective = "Get to the flag"
	Gamestate.current_objective_icon = load("res://Items/Flag/flag64.png")
	Gamestate.can_exit = true
	Gamestate.has_screen = true
	get_node("/root/Level" + str(Gamestate.current_level) + "/Klex/MainCamera/HUD/Control/Messages/LightAvailable").show_message()


func die():
	queue_free()
