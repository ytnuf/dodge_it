
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


func _on_hurt_box_body_entered(body: Node2D) -> void:
	var enemy := body as Enemy
	assert(enemy != null)
	assert(enemy.get_collision_layer_value(2) )
	died.emit()
