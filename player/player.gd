
class_name Player
extends CharacterBody2D


signal died

var score := 0
var survived_time := 0.0
var _current_graze := 0
var _is_alive := true
@onready var _graze_detector := $GrazeDetector
@onready var _lose_sfx := $LoseSfx


func _physics_process(dt: float) -> void:
	if _is_alive:
		var to_mouse := get_global_mouse_position() - position
		var dist := to_mouse.length()
		var dir := to_mouse.normalized()
		var speed := dist * 32.0
		velocity = dir * speed

		score += ceil(dt * 100)
		survived_time += dt
	else:
		var acc := 980.0
		velocity.y += acc * dt
	move_and_slide()


func _on_graze_timer_timeout() -> void:
	score += _current_graze
	_current_graze = 0
	for area in _graze_detector.get_overlapping_areas():
		var enemy := area.get_parent() as Enemy
		assert(enemy != null)
		_current_graze = max(_current_graze, enemy.graze_score() )


func _on_graze_detector_area_entered(area: Area2D) -> void:
	var enemy := area.get_parent() as Enemy
	assert(enemy != null)
	_current_graze = max(_current_graze, enemy.graze_score() )


func _on_hurt_box_body_entered(body: Node2D) -> void:
	var enemy := body as Enemy
	assert(enemy != null)
	assert(enemy.get_collision_layer_value(2) )
	died.emit()
	_lose_sfx.play()
	_is_alive = false
	velocity.x = clamp(-64.0, velocity.x, 64.0)
	velocity.y = max(velocity.y, -64.0)

