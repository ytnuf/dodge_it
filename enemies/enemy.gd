
class_name Enemy
extends RigidBody2D


@export var init_vel := Vector2(32, 32)


func set_radius(radius: float) -> void:
	$CollisionShape2D.shape.radius = radius
	var default_radius : float = $Sprite2D.texture.get_width() / 2.0
	assert(is_equal_approx(default_radius * 2.0, $Sprite2D.texture.get_height() ) )
	assert(default_radius != 0.0)
	$Sprite2D.scale *= radius / default_radius

