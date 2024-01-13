
class_name HUD
extends Control


var _enemy_count := 0
var _elapsed := 0.0
@onready var _enemy_label := $VBoxContainer/EnemyLabel
@onready var _time_label := $VBoxContainer/TimeLabel


func _process(dt: float) -> void:
	_elapsed += dt
	_time_label.text = "TIME: %d" % (_elapsed as int)


func increment_enemy() -> void:
	_enemy_count += 1
	_enemy_label.text = "ENEMY: %d" % _enemy_count
