extends Area2D


func _on_Coin_body_entered(body):
	Gamestate.coins += 1
	$AnimationPlayer.play("collected")
	
	if Gamestate.coins >= 100:
		Gamestate.coins = 0
		Gamestate.battery_life = 100
		$Count100.playing = true


func remove():
	queue_free()
