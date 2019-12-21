extends KinematicBody2D

var motion = Vector2()
var speed = 200
const ACCELERATION = 50
var direction = Vector2()
func _ready():
	pass
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		direction = Vector2(-speed,0)
	if Input.is_action_pressed("ui_right"):
		direction = Vector2(speed,0)
	if Input.is_action_pressed("ui_up"):
		direction = Vector2(0,-speed)
	if Input.is_action_pressed("ui_down"):
		direction = Vector2(0,speed)
	direction = move_and_slide(direction)
	
	

		
