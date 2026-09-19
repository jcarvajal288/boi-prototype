extends CanvasLayer

var new_item: EquippableItemData

var moved_to_b_slot = false
var moved_to_a_slot = false


func _ready() -> void:
	$NewItemSprite.texture = new_item.image
	Global.pause_game.emit(true)


func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("b_button")):
		if moved_to_b_slot:
			queue_free()
			Global.pause_game.emit(false)
			Global.b_button_slot = new_item
			Global.update_status_bar.emit()
		else:
			$NewItemSprite.texture = null
			$BItemSprite.texture = new_item.image
			$AItemSprite.texture = null
			moved_to_b_slot = true
			moved_to_a_slot = false
	elif (Input.is_action_just_pressed("a_button")):
		if moved_to_a_slot:
			queue_free()
			Global.pause_game.emit(false)
			Global.a_button_slot = new_item
			Global.update_status_bar.emit()
		else:
			$NewItemSprite.texture = null
			$BItemSprite.texture = null
			$AItemSprite.texture = new_item.image
			moved_to_b_slot = false
			moved_to_a_slot = true