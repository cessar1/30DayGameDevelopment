extends Area2D

func _ready():
	pass


func _on_Nails_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		get_tree().change_scene("res://Scenes/GameOver.tscn")