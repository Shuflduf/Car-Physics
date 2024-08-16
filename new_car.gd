extends CharacterBody3D



func _process(_delta: float) -> void:
	$CameraPivot.global_position = global_position
	$CameraPivot.rotation.y = (rotation.y + PI)

func _physics_process(delta: float) -> void:
	velocity.y += delta * get_gravity().y
	var accel = Input.get_axis("accelerate", "deccelerate") * 0.1
	var accel_dir = rf(Vector3(0, 0, accel))
	if accel_dir.z < velocity.z:
		accel_dir *= 0.5
	velocity += accel_dir

	if !accel:
		velocity.z *= 0.95
	print(velocity)

	var dir = Input.get_axis("right", "left")
	rotation.y += dir * delta

	if dir > 0.1:
		$AnimatedSprite3D.play("side")
		$AnimatedSprite3D.flip_h = false
	elif dir < -0.1:
		$AnimatedSprite3D.play("side")
		$AnimatedSprite3D.flip_h = true
	else:
		$AnimatedSprite3D.play("default")
		$AnimatedSprite3D.flip_h = false

	move_and_slide()

func rf(input: Vector3) -> Vector3:
	return input.rotated(Vector3.UP, rotation.y)
