
extends Control


func _ready() -> void:
	$VBoxContainer/ScoreLabel.text = "High Score: %d" % Score.best


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://arena/arena.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
