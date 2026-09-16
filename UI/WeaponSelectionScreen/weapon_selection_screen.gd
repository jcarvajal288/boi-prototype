extends CanvasLayer

var new_item: EquippableItemData


func _ready() -> void:
	$NewItemSprite.texture = new_item.image


func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("b_button")):
		$NewItemSprite.texture = null
		$BItemSprite.texture = new_item.image
		$AItemSprite.texture = null
	elif (Input.is_action_just_pressed("a_button")):
		$NewItemSprite.texture = null
		$BItemSprite.texture = null
		$AItemSprite.texture = new_item.image