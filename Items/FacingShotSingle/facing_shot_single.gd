extends Area2D

@export var item_data: EquippableItemData


func _ready() -> void:
	body_entered.connect(on_body_entered)
	$Sprite2D.texture = item_data.image


func on_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.open_weapon_selection_screen.emit()
		queue_free()
