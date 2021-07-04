extends Area2D


func _on_Water_body_entered(body):
	$Timer.start()

func _on_Water_body_exited(body):
	$Timer.stop()

func cause_damage():
	Gamestate.battery_life -= 2

func _on_Timer_timeout():
	cause_damage()
