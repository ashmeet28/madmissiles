extends RigidBody2D

func _physics_process(_delta):
	var const_torq:float = 0
	if Input.is_action_pressed("rotate_clockwise"):
		const_torq += 1000
	if Input.is_action_pressed("rotate_anticlockwise"):
		const_torq -= 1000
	set_constant_torque(const_torq)
	
	set_constant_force(Vector2.ZERO)
	if Input.is_action_pressed("boost"):
		add_constant_force(Vector2.UP.rotated(rotation) * 100)
