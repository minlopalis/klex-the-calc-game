extends Control



func _on_Quit_pressed():
	get_tree().quit()


func _on_NewGame_pressed():
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")


func _on_Instructions_pressed():
	$Instructions.visible = true
