extends Area2D

func _ready():
	pass


func _on_Token_body_entered(body):
	
	if body.name == "Player":
		body.speed += 40
		Main.set_tokens(Main.get_tokens() + 1)
		queue_free()
