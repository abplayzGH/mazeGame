extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D


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
		velocity.x = move_toward(velocity.x, 0, 50)
		
	if velocity.x < 0:
		sprite_2d.flip_h = true
		point_light_2d.rotation_degrees = 180
	elif velocity.x > 0:
		sprite_2d.flip_h = false
		point_light_2d.rotation_degrees = 0
		
	if velocity.y < 0:
		point_light_2d.rotation_degrees = 270
	elif velocity.y > 0:
		point_light_2d.rotation_degrees = 90
		
		
	
	move_and_slide()
