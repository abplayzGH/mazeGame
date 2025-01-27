extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:
	var vdirection := Input.get_axis("ui_up", "ui_down")
	
	if vdirection:
		velocity.y = vdirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 50)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var hdirection := Input.get_axis("ui_left", "ui_right")
	if hdirection:
		velocity.x = hdirection * SPEED
	else:
<<<<<<< HEAD
		velocity.x = move_toward(velocity.x, 0, 40)
=======
		velocity.x = move_toward(velocity.x, 0, 50)
>>>>>>> ac69c93be247e25e1ab1b6b6ecec06184fcca5bc

	move_and_slide()
