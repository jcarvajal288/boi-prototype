extends Node2D

const ROOM_SCENE = preload("res://Level/Room.tscn")
const N = 255 # code for no room
const NUM_ROOMS = 10 # number of rooms to generate
const CARDINALS = [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]

var rooms: Dictionary = {}

var current_room_coords = Vector2i.ZERO
var current_room: Node2D = null

func _ready() -> void:
	generate()
	show_current_room()


func generate() -> void:
	var prev_coord = Vector2i.ZERO
	var next_coord = prev_coord + CARDINALS.pick_random()
	var rooms_left = NUM_ROOMS - 1
	create_room_at(prev_coord)
	while rooms_left > 0:
		var room_created = create_room(prev_coord, next_coord)
		prev_coord = next_coord
		next_coord = prev_coord + CARDINALS.pick_random()
		if room_created:
			rooms_left -= 1
	for key in rooms:
		var room = rooms[key]
		room.grid_coordinates = key
		room.set_room_type()


func create_room(prev_coord: Vector2i, next_coord: Vector2i) -> bool:
	if rooms.has(next_coord):
		connect_rooms(prev_coord, next_coord)
		return false
	else:
		create_room_at(next_coord)
		connect_rooms(prev_coord, next_coord)
		return true
		

func create_room_at(next_coord: Vector2i) -> void:
	var room = ROOM_SCENE.instantiate()
	rooms[next_coord] = room


func connect_rooms(prev_coord: Vector2i, next_coord: Vector2i) -> void:
	var prev_door = next_coord - prev_coord
	var next_door = prev_coord - next_coord
	rooms[next_coord].add_door(next_door)
	rooms[prev_coord].add_door(prev_door)


func show_current_room():
	if current_room != null:
		self.remove_child(current_room)
	current_room = rooms[current_room_coords]
	add_child(current_room)


func change_room(direction: Vector2i) -> void:
	var new_coords = current_room_coords
	if direction == Vector2i.UP:
		new_coords += Vector2i.UP
	elif direction == Vector2i.DOWN:
		new_coords += Vector2i.DOWN
	elif direction == Vector2i.LEFT:
		new_coords += Vector2i.LEFT
	elif direction == Vector2i.RIGHT:
		new_coords += Vector2i.RIGHT
	if rooms.keys().has(new_coords):
		current_room_coords = new_coords
		show_current_room()