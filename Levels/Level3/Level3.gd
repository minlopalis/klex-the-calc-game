extends Control



func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_TryAgain_pressed():
	Gamestate.new_game()
	pass # Replace with function body.
