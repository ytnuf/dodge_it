
extends Node2D


@onready var _bottomright_spawnpoint : Vector2 = $BottomRightSpawnMarker.position
@onready var _enemies := $Enemies
@onready var _player : Player = $Player
@onready var _topleft_spawnpoint : Vector2 = $TopLeftSpawnMarker.position


func _on_timer_timeout() -> void:
	const ENEMY_SCENE := preload("res://enemies/enemy.tscn")
	var enemy : Enemy = ENEMY_SCENE.instantiate()

	var MIN_SQ_DIST_FROM_PLAYER := 128.0 * 128.0
	var pos := _player.position
	while pos.distance_squared_to(_player.position) <= MIN_SQ_DIST_FROM_PLAYER:
		pos = Vector2(
			randf_range(_topleft_spawnpoint.x, _bottomright_spawnpoint.x),
			randf_range(_topleft_spawnpoint.y, _bottomright_spawnpoint.y),
		)
	enemy.position = pos

	var spd := randf_range(4.0 * 32.0, 8.0 * 32.0)
	var vel_ang := randf_range(-PI, PI)
	enemy.init_vel = Vector2(spd, spd).rotated(vel_ang)

	_enemies.add_child(enemy)
