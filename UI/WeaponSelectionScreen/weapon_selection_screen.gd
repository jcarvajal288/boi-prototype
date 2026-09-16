extends CanvasLayer

var new_item: EquippableItemData


func _ready() -> void:
	$NewItemSprite.texture = new_item.image