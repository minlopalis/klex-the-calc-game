extends Area2D


func die():
	queue_free()


func _on_Bottle_body_entered(body):
	$AnimationPlayer.play("die")
	body.poisoned()
