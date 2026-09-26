extends Node

var b_button_slot: EquippableItemData
var a_button_slot: EquippableItemData

@warning_ignore_start("unused_signal")
signal add_node_to_game(node: Node2D)
signal change_room(direction: Vector2i)
signal open_weapon_selection_screen(item_data: EquippableItemData)
signal pause_game(should_pause: bool)
signal update_status_bar()
@warning_ignore_restore("unused_signal")