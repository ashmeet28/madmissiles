extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ship_propel"):
		get_node("Flame").set_visible(true)
	if Input.is_action_just_released("ship_propel"):
		get_node("Flame").set_visible(false)

func _physics_process(_delta):
	const ship_torq:float = 100000
	set_constant_torque(0)
	if Input.is_action_pressed("ship_rotate_clockwise") && get_angular_velocity() < PI:
		add_constant_torque(ship_torq)
	if Input.is_action_pressed("ship_rotate_anticlockwise") && get_angular_velocity() > -(PI):
		add_constant_torque(-ship_torq)

	if get_constant_torque() == 0:
		set_angular_damp(2)
	else:
		set_angular_damp(0)
	
	const ship_thrust:float = 1000
	set_constant_force(Vector2.ZERO)
	if Input.is_action_pressed("ship_propel"):
		add_constant_force(Vector2.UP.rotated(rotation) * ship_thrust)
	
	
