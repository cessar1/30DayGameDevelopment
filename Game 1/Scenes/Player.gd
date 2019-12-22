extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const JUMP_HEIGHT = -500
const ACCELERATION = 50
const MAX_SPEED = 200
var coins = 0 setget set_coins
var motion = Vector2()
func _ready():
	camera_set_limits()
func _physics_process(delta):	

	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
		else:
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion, Vector2(0,-1))
	
func set_coins(value):
	coins = value
	print(coins)
func camera_set_limits():
	var limit = $Limites
	$Camera2D.limit_left = limit.get_global_position().x
	$Camera2D.limit_right = limit.get_global_position().x + limit.get_size().x
	$Camera2D.limit_top = limit.get_global_position().y
	$Camera2D.limit_bottom= limit.get_global_position().y + limit.get_size().y