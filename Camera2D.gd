extends Camera2D

func _physics_process(_delta):
	set_position(lerp(get_position(), get_node("../PlayerShip").get_position(), 0.01))
