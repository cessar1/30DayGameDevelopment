extends Node2D
onready var tokens = get_node("Tokens")
var is_true = true
func _ready():
	set_camera_limits()
	
	
func set_camera_limits():
	var map_limits = $Map.get_used_rect()
	var map_cell_size = $Map.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cell_size.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cell_size.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cell_size.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cell_size.y
func _process(delta):
	open_door()
	
	
	
func open_door():
	if tokens.get_child_count() == 0 and is_true:
		is_true = false
		print("eliminada")
		$Door.queue_free()