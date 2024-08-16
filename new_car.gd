extends CharacterBody3D



func _process(_delta: float) -> void:
	$CameraPivot.global_position = global_position
	$CameraPivot.rotation.y = (rotation.y + PI)

func _physics_process(delta: float) -> void:
	velocity.y += delta * get_gravity().y
	velocity += rf(Vector3(0, 0, Input.get_axis("accelerate", "deccelerate") * 0.1))

	rotation.y += Input.get_axis("right", "left") * delta

	#velocity = rf(velocity)

	move_and_slide()

func rf(input: Vector3) -> Vector3:
	return input.rotated(Vector3.UP, rotation.y)
