extends PointLight2D
@onready var point_light_2d: PointLight2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var v_direction := Input.get_axis("ui_up","ui_down")
	var h_direction := Input.get_axis("ui_left","ui_right")
	if v_direction:
		point_light_2d.rotation = 90

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
