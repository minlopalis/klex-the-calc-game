extends Area2D


func _on_Health_body_entered(body):
	Gamestate.battery_life += 25
	if Gamestate.battery_life > 100:
		Gamestate.battery_life = 100
	$AnimationPlayer.play("die")


func die():
	queue_free()
