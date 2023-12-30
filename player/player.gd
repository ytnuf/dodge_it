
class_name Player
extends Area2D


func _physics_process(_dt: float) -> void:
	position = get_global_mouse_position()

	const WIN_SIZE := Vector2(1152.0, 640.0)
	const RADIUS := 16.0
	position.x = clamp(RADIUS, position.x, WIN_SIZE.x-RADIUS)
	position.y = clamp(RADIUS, position.y, WIN_SIZE.y-RADIUS)
