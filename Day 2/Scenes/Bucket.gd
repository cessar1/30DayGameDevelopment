extends KinematicBody2D

const ACCELERATION = 50
const MAX_SPEED = 200
var motion = Vector2()

func _ready():
	pass 
	
func _physics_process(delta):
	position.x = clamp(position.x, 20, 400)
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, 0.2)
	motion = move_and_slide(motion)