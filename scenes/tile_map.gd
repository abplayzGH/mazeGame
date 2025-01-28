extends TileMap
@onready var window : Window = get_window()

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	
	var WINDOW_SIZE = window.size
	var tile_count = WINDOW_SIZE / 32
	print(WINDOW_SIZE)
	print(tile_count)
	for x in tile_count[0]:
		print(x)
		for y in tile_count[1]:
			set_cell(0, Vector2i(x, y), 0, Vector2i(6,5))
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
