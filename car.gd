class_name Vehicle
extends VehicleBody3D

@export var max_rpm = 500
@export var max_torque = 200

@onready var back_wheels = [$BackLeft, $BackRight]

func _process(_delta: float) -> void:
	$CameraPivot.global_position = global_position
	$CameraPivot.rotation.y = (rotation.y + PI)


func _physics_process(delta: float) -> void:

	#rotation_degrees.x = clamp(rotation_degrees.x, -30, 30)
	rotation_degrees.z = 0

	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)

	var accel = Input.get_axis("deccelerate", "accelerate")

	engine_force = accel * max_torque * (1.0 / max_rpm)
