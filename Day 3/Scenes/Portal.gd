extends Area2D

func _ready():
	pass


func _on_Portal_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Game.tscn")
