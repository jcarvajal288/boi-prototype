extends Node2D

const ROOM_SCENE = preload("res://Level/Room.tscn")

var rooms: Array[Room] = []

func _ready() -> void:
	for x in range(0, 3):
		for y in range(0, 3):
			create_room(x, y)


func create_room(x: int, y: int) -> void:
	var room = ROOM_SCENE.instantiate()
	room.grid_coordinates = Vector2(x, y)
	add_child(room)
