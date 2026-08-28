class_name Room extends Sprite2D

const N = 255

var grid_coordinates: Vector2 = Vector2.ZERO

const ROOM_SIZE = 16

func _ready() -> void:
	global_position = Vector2(grid_coordinates.x * ROOM_SIZE, grid_coordinates.y * ROOM_SIZE)


func set_sprite(neighbors: Array) -> void:
	var north = neighbors[0] != N
	var south = neighbors[1] != N
	var east = neighbors[2] != N
	var west = neighbors[3] != N
	var n = [north, south, east, west]
	if n == [true, false, false, false]:
		frame = 1
	elif n == [false, true, false, false]:
		frame = 2
	elif n == [false, false, true, false]:
		frame = 3
	elif n == [false, false, false, true]:
		frame = 4
	elif n == [true, false, true, false]:
		frame = 5
	elif n == [false, true, true, false]:
		frame = 6
	elif n == [false, true, false, true]:
		frame = 7
	elif n == [true, false, false, true]:
		frame = 8
	elif n == [true, true, false, false]:
		frame = 9
	elif n == [false, false, true, true]:
		frame = 10
	elif n == [true, true, false, true]:
		frame = 11
	elif n == [true, false, true, true]:
		frame = 12
	elif n == [true, true, true, false]:
		frame = 13
	elif n == [false, true, true, true]:
		frame = 14
	elif n == [true, true, true, true]:
		frame = 15
