
class_name Enemy
extends RigidBody2D


@export var init_vel := Vector2(32, 32)
@onready var _billiard_collide := $BilliardCollideSfx
@onready var _wall_hit := $WallHitSfx


func set_radius(radius: float) -> void:
	$CollisionShape2D.shape.radius = radius
	var default_radius : float = $Sprite2D.texture.get_width() / 2.0
	assert(is_equal_approx(default_radius * 2.0, $Sprite2D.texture.get_height() ) )
	assert(default_radius != 0.0)
	$Sprite2D.scale *= radius / default_radius



func _on_body_entered(node: Node) -> void:
	var body := node as PhysicsBody2D
	if body.collision_layer == 2:
		_billiard_collide.play()
	elif body.collision_layer == 4:
		_wall_hit.play()

