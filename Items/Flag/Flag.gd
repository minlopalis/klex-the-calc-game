extends Area2D

func _on_Flag_body_entered(body):
	if Gamestate.can_exit:
		$Win.playing = true
		get_node("/root/Level" + str(Gamestate.current_level) + "/Klex/MainCamera/HUD/Control/Messages/LevelComplete").show()
		get_tree().paused = true
	else: 
		get_node("/root/Level" + str(Gamestate.current_level) + "/Klex/MainCamera/HUD/Control/Messages/ObjectiveNotMet").show()


