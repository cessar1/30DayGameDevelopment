extends Control

export(String, FILE,"*.tscn") var world_scene


func _on_Button_pressed():
	get_tree().change_scene(world_scene)
