extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed = 50


func _ready() -> void:
	var x = [-1, 1].pick_random()
	var y = [-1, 1].pick_random()
	direction = Vector2(x, y)
	velocity = direction * speed


func _physics_process(_delta: float) -> void:
	move_and_slide()
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider is TileMapLayer:
			var raw_normal = collision.get_normal()
			var normal = Vector2(
				snapped(raw_normal.x, 1.0),
				snapped(raw_normal.y, 1.0)
			)
			if normal.x != 0:
				direction.x = -direction.x
			if normal.y != 0:
				direction.y = -direction.y
			velocity = direction * speed
			$AnimatedSprite2D.flip_h = direction.x < 0
			break