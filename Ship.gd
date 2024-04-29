extends RigidBody2D

func _process(_delta):
	if Input.is_action_just_pressed("ship_propel"):
		get_node("Flame").visible = true
	if Input.is_action_just_released("ship_propel"):
		get_node("Flame").visible = false

func _physics_process(_delta):
	const SHIP_TORQ:float = 100000
	constant_torque = 0
	if Input.is_action_pressed("ship_rotate_clockwise") && angular_velocity < (PI*2):
		add_constant_torque(SHIP_TORQ)
	if Input.is_action_pressed("ship_rotate_anticlockwise") && angular_velocity > -(PI*2):
		add_constant_torque(-SHIP_TORQ)

	if constant_torque == 0:
		angular_damp = 2
	else:
		angular_damp = 0

	const SHIP_THRUST:float = 1000
	constant_force = Vector2.ZERO
	if Input.is_action_pressed("ship_propel"):
		add_constant_force(Vector2.UP.rotated(rotation) * SHIP_THRUST)
