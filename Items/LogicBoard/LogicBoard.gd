extends Area2D


func _on_LogicBoard_body_entered(body):
	$AnimationPlayer.play("collected")
	Gamestate.current_objective = "Get to the flag"
	Gamestate.current_objective_icon = load("res://Items/Flag/flag64.png")
	Gamestate.can_exit = true
	Gamestate.has_logic_board = true
	get_node("/root/Level" + str(Gamestate.current_level) + "/Klex/MainCamera/HUD/Control/Messages/LogicBoardCollected").show_message()

func remove():
	queue_free()
