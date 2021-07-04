extends Area2D

func _on_Ladder_body_entered(body):
	if body.name == "Klex":
		body.on_ladder = true
	pass # Replace with function body.


func _on_Ladder_body_exited(body):
	if body.name == "Klex":
		body.on_ladder = false
	pass # Replace with function body.
