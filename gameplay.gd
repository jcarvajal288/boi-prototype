extends Node2D


func _ready() -> void:
	Global.pause_game.connect(pause_game)	


func pause_game(should_pause: bool) -> void:
	if should_pause:
		set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	else:
		set_deferred("process_mode", Node.PROCESS_MODE_INHERIT)