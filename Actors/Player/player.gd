extends CharacterBody2D

const SPEED = 50

var facing = "Down"


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		facing = "Up"
		velocity = SPEED * Vector2.UP
		$AnimationPlayer.play("walk" + facing)
	elif Input.is_action_pressed("ui_down"):
		facing = "Down"
		velocity = SPEED * Vector2.DOWN
		$AnimationPlayer.play("walk" + facing)
	elif Input.is_action_pressed("ui_left"):
		facing = "Left"
		velocity = SPEED * Vector2.LEFT
		$AnimationPlayer.play("walk" + facing)
	elif Input.is_action_pressed("ui_right"):
		facing = "Right"
		velocity = SPEED * Vector2.RIGHT
		$AnimationPlayer.play("walk" + facing)
	else:
		velocity = Vector2.ZERO
		$AnimationPlayer.play("idle" + facing)
	move_and_slide()
