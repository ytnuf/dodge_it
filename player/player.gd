
class_name Player
extends Area2D


signal died

var arena_bottom : float
var arena_left : float
var arena_right : float
var arena_top : float
@onready var _radius : float = $CollisionShape2D.shape.radius


func _physics_process(_dt: float) -> void:
	position = get_global_mouse_position()

	position.x = clamp(arena_left + _radius, position.x, arena_right - _radius)
	position.y = clamp(arena_top + _radius, position.y, arena_bottom - _radius)


func _on_hit() -> void:
	died.emit()
