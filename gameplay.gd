extends Node2D


func _ready() -> void:
	Global.pause_game.connect(pause_game)	
	Global.add_node_to_game.connect(add_node_to_game)


func pause_game(should_pause: bool) -> void:
	if should_pause:
		set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	else:
		set_deferred("process_mode", Node.PROCESS_MODE_INHERIT)


func add_node_to_game(node: Node2D) -> void:
	add_child(node)