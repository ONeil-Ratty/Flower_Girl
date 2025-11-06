extends CharacterBody2D


const SPEED = 45
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("ui_left", "ui_right")
	var ydirection := Input.get_axis("ui_up", "ui_down")
	if xdirection:
			if Input.is_action_pressed("left"):
				$AnimatedSprite2D.play("walk_left")
				velocity.x = xdirection * SPEED
			elif Input.is_action_pressed("right"):
				$AnimatedSprite2D.play("walk_right")
				velocity.x = xdirection * SPEED
	elif ydirection:
			if Input.is_action_pressed("up"):
				$AnimatedSprite2D.play("walk _up")
				velocity.y = ydirection * SPEED
			elif Input.is_action_pressed("down"):
				$AnimatedSprite2D.play("walk_down")
				velocity.y = ydirection * SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
