extends Timer

func _on_LevelTimer_timeout():
	Gamestate.battery_life -= 1
