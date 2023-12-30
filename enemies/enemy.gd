
class_name Enemy
extends RigidBody2D


@export var init_vel := Vector2(32, 32)


func _ready() -> void:
	linear_velocity = init_vel
