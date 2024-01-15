
extends Node2D


@onready var _bottom_right : Vector2 = $BottomRight.position
@onready var _enemies := $Enemies
@onready var _enemy_timer := $EnemyTimer
@onready var _hud : HUD = $HudCanvasLayer/HUD
@onready var _pause_menu := $PauseCanvasLayer/Pause
@onready var _player : Player = $Player
@onready var _top_left : Vector2 = $TopLeft.position


func _unhandled_input(ev: InputEvent) -> void:
	if ev.is_action_pressed("pause"):
		_pause_menu.activate(true)


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
	_hud.increment_enemy()

	var spd := randf_range(8.0 * 32.0, 16.0 * 32.0)
	var vel_ang := randf_range(-PI, PI)
	enemy.linear_velocity = Vector2(spd, 0.0).rotated(vel_ang)

	_enemy_timer.wait_time += 4.0


func _on_player_died() -> void:
	get_tree().paused = true
