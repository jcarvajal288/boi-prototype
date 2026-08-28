extends Node2D

const ROOM_SCENE = preload("res://Level/Room.tscn")
const N = 255 # code for no room

var rooms: Array[Room] = []

var adjacency_graph = [
   # N, S, E, W
	[N, 3, 1, N],
	[N, 4, 2, 0],
	[N, 5, N, 1],
	[0, 6, 4, N],
	[1, 7, 5, 2],
	[2, 8, N, 4],
	[3, N, 7, N],
	[4, N, 8, 6],
	[5, N, N, 7],
]

func _ready() -> void:
	for x in range(0, 3):
		for y in range(0, 3):
			create_room(x, y)


func create_room(x: int, y: int) -> void:
	var room_index = y * 3 + x
	var room = ROOM_SCENE.instantiate()
	room.grid_coordinates = Vector2(x, y)
	room.set_sprite(adjacency_graph[room_index])
	rooms.append(room)
	add_child(room)
