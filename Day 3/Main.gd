extends Node
var token = 0 setget set_tokens, get_tokens
signal toked_updated
func _ready():
	pass
func set_tokens(value):
	token = value
	emit_signal("toked_updated")
func get_tokens():
	return token