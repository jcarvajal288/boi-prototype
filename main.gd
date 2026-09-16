extends Node2D

const WEAPON_SELECTION_SCENE = preload("res://UI/WeaponSelectionScreen/WeaponSelectionScreen.tscn")

func _ready() -> void:
	Global.open_weapon_selection_screen.connect(on_weapon_select)


func on_weapon_select(item_data: EquippableItemData) -> void:
	var screen = WEAPON_SELECTION_SCENE.instantiate()
	screen.new_item = item_data
	add_child(screen)
	
