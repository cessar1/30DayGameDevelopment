extends Area2D

export(String, FILE,"*.tscn") var world_scene
var player
func _on_Lava_body_entered(body):
	if body.name == "Player":
		$Sound.play()
	
		body.hide()
	
	

func _on_AudioStreamPlayer_finished():
	get_tree().change_scene(world_scene)
	
