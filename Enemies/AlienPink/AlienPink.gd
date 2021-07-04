extends Area2D

signal hit

func _on_AlienPink_body_entered(body):
	Gamestate.battery_life -= 20
	emit_signal("hit")
