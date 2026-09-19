extends CanvasLayer

var new_item: EquippableItemData

var moved_to_b_slot = false
var moved_to_a_slot = false


func _ready() -> void:
	$NewItemSprite.texture = new_item.image
	Global.pause_game.emit(true)


func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("b_button", false, false)):
		if moved_to_b_slot:
			queue_free()
			Global.pause_game.emit(false)
			Global.b_button_slot = new_item
			Global.update_status_bar.emit()
			get_viewport().set_input_as_handled()
		else:
			$NewItemSprite.texture = null
			$BItemSprite.texture = new_item.image
			$AItemSprite.texture = null
			moved_to_b_slot = true
			moved_to_a_slot = false
	elif (event.is_action_pressed("a_button", false, false)):
		if moved_to_a_slot:
			queue_free()
			Global.pause_game.emit(false)
			Global.a_button_slot = new_item
			Global.update_status_bar.emit()
			get_viewport().set_input_as_handled()
		else:
			$NewItemSprite.texture = null
			$BItemSprite.texture = null
			$AItemSprite.texture = new_item.image
			moved_to_b_slot = false
			moved_to_a_slot = true