extends Control

func _ready():
	$Texture.hide()


func _on_Ball_impulse_changed(impulse):
	$Texture.show()
	$Texture.value = impulse


func _on_Ball_impulse_reset(impulse):
	$Texture.value = impulse
	$Texture.hide()
