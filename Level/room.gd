class_name Room extends Sprite2D

const N = 255

var grid_coordinates: Vector2 = Vector2.ZERO
var doors: Array[bool] = [false, false, false, false] # N, S, E, W

const ROOM_SIZE = 16

func _ready() -> void:
	global_position = Vector2(grid_coordinates.x * ROOM_SIZE, grid_coordinates.y * ROOM_SIZE)


func set_sprite() -> void:
	if doors == [true, false, false, false]:
		frame = 1
	elif doors == [false, true, false, false]:
		frame = 2
	elif doors == [false, false, true, false]:
		frame = 3
	elif doors == [false, false, false, true]:
		frame = 4
	elif doors == [true, false, true, false]:
		frame = 5
	elif doors == [false, true, true, false]:
		frame = 6
	elif doors == [false, true, false, true]:
		frame = 7
	elif doors == [true, false, false, true]:
		frame = 8
	elif doors == [true, true, false, false]:
		frame = 9
	elif doors == [false, false, true, true]:
		frame = 10
	elif doors == [true, true, false, true]:
		frame = 11
	elif doors == [true, false, true, true]:
		frame = 12
	elif doors == [true, true, true, false]:
		frame = 13
	elif doors == [false, true, true, true]:
		frame = 14
	elif doors == [true, true, true, true]:
		frame = 15


func add_door(direction: Vector2i) -> void:
	if direction == Vector2i.UP:
		doors[0] = true
	elif direction == Vector2i.DOWN:
		doors[1] = true
	elif direction == Vector2i.RIGHT:
		doors[2] = true
	elif direction == Vector2i.LEFT:
		doors[3] = true
	else:
		print("Non Orthagonal door direction:")
		print(direction)