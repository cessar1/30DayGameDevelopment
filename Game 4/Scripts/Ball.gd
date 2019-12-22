extends RigidBody2D
var mouse_position 
var impulse_force = 0
const ACCELERATION = 10
const MAX_INPULSE = 700
signal impulse_changed(impulse)
signal impulse_reset(impulse)
func _ready():
	pass
func _process(delta):
	
	choose_direction()
func _physics_process(delta):
	
	create_impuse()
	if max(abs(linear_velocity.x),abs(linear_velocity.y)) < 30:
		linear_velocity = Vector2()
		angular_velocity = 0
	
		$Directioner.show()
	#print(max(abs(linear_velocity.x),abs(linear_velocity.y)))
	
		

func choose_direction():
	if Input.is_action_pressed("ui_left"):
		$Directioner.rotation -= 0.1
	elif Input.is_action_pressed("ui_right"):
		$Directioner.rotation += 0.1

func create_impuse():
	
	if Input.is_action_pressed("ui_select"):
		
		impulse_force = min(impulse_force + ACCELERATION, MAX_INPULSE)
		emit_signal("impulse_changed", impulse_force)
	elif Input.is_action_just_released("ui_select"):
		var angle = $Directioner.global_rotation
		$Directioner.hide()
		linear_velocity = Vector2(impulse_force * cos(angle),impulse_force * sin(angle))
		impulse_force = 0
		emit_signal("impulse_reset", impulse_force)
