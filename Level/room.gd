class_name Room extends Sprite2D

var grid_coordinates: Vector2 = Vector2.ZERO

const ROOM_SIZE = 16

func _ready() -> void:
	global_position = Vector2(grid_coordinates.x * ROOM_SIZE, grid_coordinates.y * ROOM_SIZE)
