extends Area2D



func _on_Life_body_entered(body):
	Gamestate.lives += 1
	$AnimationPlayer.play("die")


func die():
	queue_free()
