
class_name Player
extends Area2D

signal died


func _physics_process(_dt: float) -> void:
	position = get_global_mouse_position()

	var win_w : float = ProjectSettings.get_setting("display/window/size/viewport_width")
	var win_h : float = ProjectSettings.get_setting("display/window/size/viewport_height")
	const RADIUS := 16.0
	position.x = clamp(RADIUS, position.x, win_w - RADIUS)
	position.y = clamp(RADIUS, position.y, win_h - RADIUS)


func _on_hit() -> void:
	died.emit()
