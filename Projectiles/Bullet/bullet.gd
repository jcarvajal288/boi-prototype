extends Sprite2D

var speed = 300
var direction = Vector2.ZERO

func _ready() -> void:
	$Area2D.area_entered.connect(_on_area_entered)
	$Area2D.body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	var displacement = speed * direction * delta
	global_position += displacement


func _on_area_entered(_area: Area2D) -> void:
	queue_free()


func _on_body_entered(_body: Node2D) -> void:
	queue_free()