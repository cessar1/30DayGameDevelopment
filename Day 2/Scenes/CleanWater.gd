extends Area2D
var is_not_clean = true
var speed = 1
var thing 
signal water_grabbed

func _ready():
	pass
func _physics_process(delta):
	position.y += speed * delta
	if position.y > 600:
		queue_free()
func set_water_quality():
	var number = randi() % 4
	if number != 0:
		is_not_clean = false
	if is_not_clean:
		$Polygon2D.color = Color(0.886719, 0.839742, 0.135086)


func _on_Water_body_entered(body):
	if not $Sound.playing:
		$Sound.play()
	thing = body
	hide()
	

func _on_Sound_finished():
	if thing.name == "Bucket" and is_not_clean:
		
		thing.queue_free()
		queue_free()
		get_tree().change_scene("res://Scenes/GameOver.tscn")
	else:
		queue_free()
		emit_signal("water_grabbed")
