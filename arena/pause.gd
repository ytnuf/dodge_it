
extends Control


@onready var _pause_off := $PauseOffSfx
@onready var _pause_on := $PauseOnSfx


func _input(ev: InputEvent) -> void:
	if ev.is_action_pressed("pause"):
		activate(false)
		get_viewport().set_input_as_handled()


func activate(is_active: bool) -> void:
	visible = is_active
	get_tree().paused = is_active
	if is_active:
		_pause_on.play()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		_pause_off.play()
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
