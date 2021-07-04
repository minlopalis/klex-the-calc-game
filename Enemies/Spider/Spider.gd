extends Area2D


func _on_Spider_body_entered(body):
	$Stomp/StompCollision.disabled = true
	body.collide_with_enemy()
	$Stomp/StompTimer.start()
	Gamestate.battery_life -= 15
	yield(get_tree(), "idle_frame") # bypass gravity by skipping next frame


func die():
	queue_free()


func _on_Stomp_body_entered(body):
	$CollisionShape2D.disabled = true
	if !$Stomp/StompTimer.time_left > 0:
		body.stomp_bounce()
		$SpiderAnimation.play("die")


func _on_StompDisable_timeout():
	$Stomp/StompCollision.disabled = false
