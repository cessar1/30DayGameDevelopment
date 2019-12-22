extends Area2D



func _on_Coin_body_entered(body):
	if body.name == "Player":
		$Sound.play()
		body.coins += 1
		


func _on_Sound_finished():
	queue_free()
