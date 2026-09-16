extends Node2D

const WEAPON_SELECTION_SCENE = preload("res://UI/WeaponSelectionScreen/WeaponSelectionScreen.tscn")

func _ready() -> void:
	Global.open_weapon_selection_screen.connect(on_weapon_select)


func on_weapon_select() -> void:
	var screen = WEAPON_SELECTION_SCENE.instantiate()
	add_child(screen)
	
