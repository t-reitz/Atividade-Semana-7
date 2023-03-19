extends Node2D

func _process(_delta):
	# set labels com valores do jogo
	$kills.text = str(Global.enemies_killed)
	$shots.text = str(Global.shots_fired)
	#divisao por 0 crasha o jogo
	if Global.shots_fired == 0:
		$acc.text = str(0) + " %"
	else:
		$acc.text = str(Global.enemies_killed * 100 / Global.shots_fired) + " %"


func _on_Button_pressed():
	# reset nos valores
	Global.shots_fired = 0
	Global.enemies_killed = 0
	# chamar main scene denovo
	get_tree().change_scene("res://MainScene.tscn")


func _on_Button2_pressed():
	# quit game
	get_tree().quit()
