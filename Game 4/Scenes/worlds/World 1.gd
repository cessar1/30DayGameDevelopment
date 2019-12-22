extends Node2D
onready var ball = get_node("Ball")
onready var bar = get_node("Bar")
func _ready():
	pass
func _process(delta):
	bar.rect_position = ball.position + Vector2(-30,-45)



func _on_Hole_body_entered(body):
	body.queue_free()
	get_tree().change_scene("res://Scenes/GameOver.tscn")
