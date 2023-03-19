extends Node2D

# start no game 
func _on_StartButton_pressed():
	get_tree().change_scene("res://MainScene.tscn")

# quit game
func _on_QuitButton_pressed():
	get_tree().quit()
