extends Camera2D


func _physics_process(_delta):
	position = lerp(position, get_node("../Ship").position, 0.08)
