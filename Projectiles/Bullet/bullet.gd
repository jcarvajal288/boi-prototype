extends Sprite2D

var speed = 300
var direction = Vector2.ZERO


func _physics_process(delta: float) -> void:
	var displacement = speed * direction * delta
	global_position += displacement