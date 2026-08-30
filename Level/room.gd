class_name Room extends Node2D

const N = 255

var grid_coordinates: Vector2 = Vector2.ZERO
var doors: Array[bool] = [false, false, false, false] # N, S, E, W
var rooms: Array[PackedScene] = [
	preload("res://Level/Rooms/Null_Room.tscn"),
	preload("res://Level/Rooms/N_Room.tscn"),
	preload("res://Level/Rooms/S_Room.tscn"),
	preload("res://Level/Rooms/E_Room.tscn"),
	preload("res://Level/Rooms/W_Room.tscn"),
	preload("res://Level/Rooms/NE_Room.tscn"),
	preload("res://Level/Rooms/SE_Room.tscn"),
	preload("res://Level/Rooms/SW_Room.tscn"),
	preload("res://Level/Rooms/NW_Room.tscn"),
	preload("res://Level/Rooms/NS_Room.tscn"),
	preload("res://Level/Rooms/EW_Room.tscn"),
	preload("res://Level/Rooms/NSW_Room.tscn"),
	preload("res://Level/Rooms/NEW_Room.tscn"),
	preload("res://Level/Rooms/NSE_Room.tscn"),
	preload("res://Level/Rooms/SEW_Room.tscn"),
	preload("res://Level/Rooms/NSEW_Room.tscn")
]

const ROOM_WIDTH = 160
const ROOM_HEIGHT = 128

func _ready() -> void:
	global_position = Vector2(grid_coordinates.x * ROOM_WIDTH, grid_coordinates.y * ROOM_HEIGHT)


func set_room_type() -> void:
	var room_index = 0
	if doors == [true, false, false, false]:
		room_index = 1
	elif doors == [false, true, false, false]:
		room_index = 2
	elif doors == [false, false, true, false]:
		room_index = 3
	elif doors == [false, false, false, true]:
		room_index = 4
	elif doors == [true, false, true, false]:
		room_index = 5
	elif doors == [false, true, true, false]:
		room_index = 6
	elif doors == [false, true, false, true]:
		room_index = 7
	elif doors == [true, false, false, true]:
		room_index = 8
	elif doors == [true, true, false, false]:
		room_index = 9
	elif doors == [false, false, true, true]:
		room_index = 10
	elif doors == [true, true, false, true]:
		room_index = 11
	elif doors == [true, false, true, true]:
		room_index = 12
	elif doors == [true, true, true, false]:
		room_index = 13
	elif doors == [false, true, true, true]:
		room_index = 14
	elif doors == [true, true, true, true]:
		room_index = 15
	var room_node = rooms[room_index].instantiate()
	add_child(room_node)


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
