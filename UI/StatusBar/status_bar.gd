extends CanvasLayer


func _ready() -> void:
	Global.update_status_bar.connect(update)


func update() -> void:
	if Global.b_button_slot:
		$BItemSprite.texture = Global.b_button_slot.image
	if Global.a_button_slot:
		$AItemSprite.texture = Global.a_button_slot.image