extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ship_propel"):
		get_node("Flame").visible = true
	if Input.is_action_just_released("ship_propel"):
		get_node("Flame").visible = false

func _physics_process(_delta):
	set_constant_torque(0)
	if Input.is_action_pressed("ship_rotate_clockwise"):
		add_constant_torque(50000)
	if Input.is_action_pressed("ship_rotate_anticlockwise"):
		add_constant_torque(-50000)

	if get_constant_torque() == 0:
		set_angular_damp(2)
	else:
		set_angular_damp(0);
		
	set_constant_force(Vector2.ZERO)
	if Input.is_action_pressed("ship_propel"):
		add_constant_force(Vector2.UP.rotated(rotation) * 100)
	
	
