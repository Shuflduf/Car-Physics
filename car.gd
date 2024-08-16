class_name Vehicle
extends VehicleBody3D

@onready var wheels: Array[BaseWheel] = [$FrontLeft, $BackRight, $FrontRight, $BackLeft]

enum Direction {
	LEFT,
	RIGHT,
	NONE,
}

func _process(_delta: float) -> void:
	$CameraPivot.global_position = global_position
	$CameraPivot.rotation.y = (rotation.y + PI)

func rotate_forwards(dir: Vector3) -> Vector3:
	return dir.rotated(Vector3.UP, rotation.y)

#func _physics_process(_delta: float) -> void:
#
	#engine_force = Input.get_axis("deccelerate", "accelerate") * 100
#
	#var dir = Input.get_axis("right", "left")
	#if dir:
		#if dir > 0.1:
			#turn(Direction.LEFT, 1)
		#elif dir < -0.1:
			#turn(Direction.RIGHT, 1)
	#else:
		#for wheel in wheels:
			#wheel.engine_force = 0

#<<<<<<< HEAD
#<<<<<<< HEAD
	#var accel = Input.get_axis("deccelerate", "accelerate")
#
	#engine_force = accel * max_torque * (1.0 / max_rpm)
#=======
#
#=======
#
#>>>>>>> parent of 8d5be6d (better, but still bad car movement)
#func turn(dir: Direction, strength: int):
	#for wheel in wheels:
		#match wheel.desired_direction:
			#Direction.NONE:
				#pass
			#dir:
				#wheel.engine_force = -strength * 50
			#_:
				#wheel.engine_force = strength * 50
#<<<<<<< HEAD
#>>>>>>> parent of 8d5be6d (better, but still bad car movement)
#=======
#>>>>>>> parent of 8d5be6d (better, but still bad car movement)
