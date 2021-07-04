extends Area2D

signal hit

func _on_Bee_body_entered(body):
	Gamestate.battery_life -= 10
	emit_signal("hit")
