
class_name Enemy
extends RigidBody2D


@export var init_vel := Vector2(32, 32)
@export var rel_size := 1.0


func _ready() -> void:
	mass = rel_size
	$CollisionShape2D.shape.radius *= rel_size
	$Polygon2D.scale *= rel_size


func activate() -> void:
	linear_velocity = init_vel

