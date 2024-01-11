
class_name Enemy
extends RigidBody2D


@export var init_vel := Vector2(32, 32)


func set_radius(radius: float) -> void:
	$CollisionShape2D.shape.radius = radius
	var default_radius : float = $Polygon2D.polygon[0].length()
	assert(default_radius != 0.0)
	$Polygon2D.scale *= radius / default_radius

