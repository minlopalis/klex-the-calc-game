extends Control

func _ready():
	get_tree().paused = true


func _on_Quit_pressed():
	get_tree().quit()


func _on_TryAgain_pressed():
	Gamestate.new_game()
