class_name Player extends CharacterBody2D

const SPEED = 50

var facing = "Down"


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("b_button", false, false) and Global.b_button_slot:
			call(Global.b_button_slot.function)
		elif event.is_action_pressed("a_button", false, false) and Global.a_button_slot:
			call(Global.a_button_slot.function)


func _process(_delta: float) -> void:
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



func placeholder() -> void:
	pass


func facing_shot_single() -> void:
	print("facing shot single")