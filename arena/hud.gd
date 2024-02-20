
class_name HUD
extends Control


var _enemy_count := 0
@onready var _enemy_label := $VBoxContainer/EnemyLabel
@onready var _score_label := $VBoxContainer/ScoreLabel
@onready var _time_label := $VBoxContainer/TimeLabel


func increment_enemy() -> void:
	_enemy_count += 1
	_enemy_label.text = "ENEMIES:  %d" % _enemy_count


func set_score(score: int) -> void:
	_score_label.text = "SCORE:  %d" % score


func set_time(elapsed: int) -> void:
	_time_label.text = "TIME:  %d" % elapsed
