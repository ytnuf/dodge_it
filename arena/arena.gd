
extends Node2D


var _elapsed := 0.0
@onready var _bottom_right : Vector2 = $BottomRight.position
@onready var _enemies := $Enemies
@onready var _player : Player = $Player
@onready var _time_label := $HUDCanvasLayer/HUD/HBoxContainer/Left/VBoxContainer/TimeLabel
@onready var _top_left : Vector2 = $TopLeft.position


func _ready() -> void:
	_player.arena_bottom = _bottom_right.y
	_player.arena_left = _top_left.x
	_player.arena_right = _bottom_right.x
	_player.arena_top = _top_left.y


func _physics_process(dt: float) -> void:
	_elapsed += dt
	_time_label.text = "TIME:\n %d" % _elapsed


func _on_timer_timeout() -> void:
	const ENEMY_SCENE := preload("res://enemies/enemy.tscn")
	var enemy : Enemy = ENEMY_SCENE.instantiate()

	var radius := randf_range(0.5 * 32.0, 2.5 * 32.0)
	enemy.set_radius(radius)

	var pos := _player.position
	while pos.distance_squared_to(_player.position) <= radius * radius:
		pos = Vector2(
			randf_range(_top_left.x + radius, _bottom_right.x - radius),
			randf_range(_top_left.y + radius, _bottom_right.y - radius),
		)
	enemy.position = pos

	enemy.mass = randf_range(0.5, 4.0)

	_enemies.add_child(enemy)

	var spd := randf_range(8.0 * 32.0, 16.0 * 32.0)
	var vel_ang := randf_range(-PI, PI)
	enemy.linear_velocity = Vector2(spd, 0.0).rotated(vel_ang)


func _on_player_died() -> void:
	get_tree().paused = true
