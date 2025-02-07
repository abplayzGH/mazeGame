extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var pointLight: PointLight2D = $PointLight2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:
	var vdirection := Input.get_axis("up4", "down4")
	
	if vdirection:
		velocity.y = vdirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 50)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var hdirection := Input.get_axis("left4", "right4")
	if hdirection:
		velocity.x = hdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)
		
	if velocity.x < 0:
		sprite_2d.flip_h = true
	
	
	elif velocity.x > 0:
		sprite_2d.flip_h = false
	
		
	
	move_and_slide()




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name != "Player4" and body.name != "TileMap":
		print("You died") 
		print(body)
		body.position = Vector2(-1000,-1000)
		
	
