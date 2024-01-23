
extends Node


const SAVE_FILE_PATH := &"user://score.save"

var latest := 0
var best := 0:
	set(val):
		best = val
		var save_file := FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
		save_file.store_64(best)

func _ready() -> void:
	if FileAccess.file_exists(SAVE_FILE_PATH):
		var save_file := FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
		best = save_file.get_64()
