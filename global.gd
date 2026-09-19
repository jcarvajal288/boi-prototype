extends Node

@warning_ignore_start("unused_signal")
signal change_room(direction: Vector2i)
signal open_weapon_selection_screen(item_data: EquippableItemData)
signal pause_game(should_pause: bool)
@warning_ignore_restore("unused_signal")