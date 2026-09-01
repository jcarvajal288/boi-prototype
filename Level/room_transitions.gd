extends Node2D


func _ready() -> void:
	$NorthExit.body_entered.connect(on_north_exit)
	$SouthExit.body_entered.connect(on_south_exit)
	$EastExit.body_entered.connect(on_east_exit)
	$WestExit.body_entered.connect(on_west_exit)


func on_north_exit(body: Node2D) -> void:
	if body is Player:
		Global.change_room.emit(Vector2i.UP)	
		body.global_position = $SouthEntrance.global_position


func on_south_exit(body: Node2D) -> void:
	if body is Player:
		Global.change_room.emit(Vector2i.DOWN)	
		body.global_position = $NorthEntrance.global_position


func on_east_exit(body: Node2D) -> void:
	if body is Player:
		Global.change_room.emit(Vector2i.RIGHT)	
		body.global_position = $WestEntrance.global_position


func on_west_exit(body: Node2D) -> void:
	if body is Player:
		Global.change_room.emit(Vector2i.LEFT)	
		body.global_position = $EastEntrance.global_position