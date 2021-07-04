extends Area2D

signal hit


func _on_Worm_body_entered(body):
	$Stomp/StompCollision.disabled = true
	$Stomp/StompTimer.start()
	Gamestate.battery_life -= 10
	emit_signal("hit")


func _on_Stomp_body_entered(body):
	$WormCollision.disabled = true
	if !$Stomp/StompTimer.time_left > 0:
		body.stomp_bounce()
		$AnimationPlayer.play("die")


func _on_StompTimer_timeout():
	$Stomp/StompCollision.disabled = false


func die():
	queue_free()
