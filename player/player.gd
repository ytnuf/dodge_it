
class_name Player
extends CharacterBody2D


signal died


func _physics_process(_dt: float) -> void:
	var to_mouse := get_global_mouse_position() - position
	var dist := to_mouse.length()
	var dir := to_mouse.normalized()
	var speed := dist * 32.0
	velocity = dir * speed
	move_and_slide()

	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var collider := collision.get_collider() as PhysicsBody2D
		assert(collider != null)
		if collider.get_collision_layer_value(2):
			died.emit()

