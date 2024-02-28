
extends Node


const SAVE_FILE_PATH := &"user://score.save"
const VERSION := &"v1"


var latest := 0

var best := 0:
	set(val):
		best = val
		var cfg := ConfigFile.new()
		cfg.set_value(VERSION, &"score", best)
		cfg.save(SAVE_FILE_PATH)


func _ready() -> void:
	if FileAccess.file_exists(SAVE_FILE_PATH):
		var cfg := ConfigFile.new()
		var err := cfg.load(SAVE_FILE_PATH)
		if err:
			print("Unable to load save file: ", err)
			return
		best = cfg.get_value(VERSION, &"score", 0)
