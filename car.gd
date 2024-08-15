extends RigidBody3D



func _process(_delta: float) -> void:
	$CameraPivot.global_position = global_position

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("accelerate"):
		apply_central_force(Vector3.FORWARD * 5)
