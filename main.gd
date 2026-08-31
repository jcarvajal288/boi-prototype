extends Node2D


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		$Level.change_room(Vector2i.UP)
	elif Input.is_action_just_pressed("ui_down"):
		$Level.change_room(Vector2i.DOWN)
	elif Input.is_action_just_pressed("ui_left"):
		$Level.change_room(Vector2i.LEFT)
	elif Input.is_action_just_pressed("ui_right"):
		$Level.change_room(Vector2i.RIGHT)
