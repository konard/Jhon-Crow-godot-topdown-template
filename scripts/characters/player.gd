extends CharacterBody2D
## Player character controller for top-down movement.
##
## Uses physics-based movement with acceleration and friction for smooth control.
## Supports WASD and arrow key input via configured input actions.

## Maximum movement speed in pixels per second.
@export var max_speed: float = 200.0

## Acceleration rate - how quickly the player reaches max speed.
@export var acceleration: float = 1200.0

## Friction rate - how quickly the player slows down when not moving.
@export var friction: float = 1000.0


func _physics_process(delta: float) -> void:
	var input_direction := _get_input_direction()

	if input_direction != Vector2.ZERO:
		# Apply acceleration towards the input direction
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		# Apply friction to slow down
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()


func _get_input_direction() -> Vector2:
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	# Normalize to prevent faster diagonal movement
	if direction.length() > 1.0:
		direction = direction.normalized()

	return direction
