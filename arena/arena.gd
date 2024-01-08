
extends Node2D


@onready var _bottom_right : Vector2 = $BottomRight.position
@onready var _enemies := $Enemies
@onready var _player : Player = $Player
@onready var _top_left : Vector2 = $TopLeft.position


func _ready() -> void:
	_player.arena_bottom = _bottom_right.y
	_player.arena_left = _top_left.x
	_player.arena_right = _bottom_right.x
	_player.arena_top = _top_left.y


func _on_timer_timeout() -> void:
	const ENEMY_SCENE := preload("res://enemies/enemy.tscn")
	var enemy : Enemy = ENEMY_SCENE.instantiate()

	const MIN_SQ_DIST_FROM_PLAYER := 128.0 * 128.0
	const MAX_ENEMY_SIZE := 64.0
	var pos := _player.position
	while pos.distance_squared_to(_player.position) <= MIN_SQ_DIST_FROM_PLAYER:
		pos = Vector2(
			randf_range(_top_left.x + MAX_ENEMY_SIZE, _bottom_right.x - MAX_ENEMY_SIZE),
			randf_range(_top_left.y + MAX_ENEMY_SIZE, _bottom_right.y - MAX_ENEMY_SIZE),
		)
	enemy.position = pos

	var spd := randf_range(4.0 * 32.0, 8.0 * 32.0)
	var vel_ang := randf_range(-PI, PI)
	enemy.init_vel = Vector2(spd, spd).rotated(vel_ang)

	enemy.rel_size = randf_range(0.5, 2.0)

	_enemies.add_child(enemy)


func _on_player_died() -> void:
	get_tree().paused = true
