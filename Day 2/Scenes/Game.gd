extends Node2D
var screen_size
var level = 1
var points = 0
signal poinst_updated(points)
onready var water = preload("res://Scenes/CleanWater.tscn")
onready var water_container = get_node("WaterContainer")

func _ready():
	$Sound.play()
	randomize()
	screen_size = get_viewport_rect().size	
	spawn_raindrops(10)
func _process(delta):
	if water_container.get_child_count() == 0:
		level += 1
		spawn_raindrops(10 + level * 5)

func spawn_raindrops(count):
	for i in count:
		var w = water.instance()
		water_container.add_child(w)
		w.connect("water_grabbed", self, "on_water_grabbed")
		w.set_water_quality()
		w.position = Vector2(rand_range(40, screen_size.x - 40),
		rand_range(-20 , 0))
		w.speed = rand_range(100 , 250)

func on_water_grabbed():
	points += 10
	Score.score = points
	emit_signal("poinst_updated", points)
	