extends Control

func _ready():
	$ColorRect/Putos.text = "Tu puntaje es:" + " " + str(Score.score)


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
