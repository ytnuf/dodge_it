
extends Control


func _ready() -> void:
	print(Input.mouse_mode)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	print(Input.mouse_mode)
	print(Input.MOUSE_MODE_VISIBLE)
	var new_best := Score.latest > Score.best
	if new_best:
		Score.best = Score.latest
		$VBoxContainer/GameOverLabel.text = "Game Over! New High Score!"
	$VBoxContainer/ScoreLabel.text = "Your Score: %d" % Score.latest
	$VBoxContainer/BestLabel.text = "Best Score: %d" % Score.best


func _on_main_menu_button_pressed() -> void:
	var MAIN_MENU_SCENE := load("res://menu/main_menu.tscn")
	get_tree().change_scene_to_packed(MAIN_MENU_SCENE)


func _on_reset_button_pressed() -> void:
	var ARENA_SCENE := load("res://arena/arena.tscn")
	get_tree().change_scene_to_packed(ARENA_SCENE)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
