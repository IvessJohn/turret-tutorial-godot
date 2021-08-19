extends KinematicBody2D

export(int) var SPEED: int = 200
var velocity: Vector2 = Vector2.ZERO


func _physics_process(delta):
	var input_dir: Vector2 = get_input_direction()
	if input_dir != Vector2.ZERO:
		velocity = SPEED * input_dir
	else:
		velocity = Vector2.ZERO
	move()

func move():
	velocity = move_and_slide(velocity)

func get_input_direction() -> Vector2:
	var input_direction = Vector2.ZERO
	
	input_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_direction = input_direction.normalized()
	
	return input_direction
