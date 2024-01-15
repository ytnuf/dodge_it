
extends Control


func _input(ev: InputEvent) -> void:
	if ev.is_action_pressed("pause"):
		visible = false
		get_tree().paused = false
		get_viewport().set_input_as_handled()
