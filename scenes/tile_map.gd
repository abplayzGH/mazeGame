extends TileMap
@onready var window : Window = get_window()

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	mazeGenerate()
	var WINDOW_SIZE = window.size
	var tile_count = WINDOW_SIZE / 32
	for x in tile_count[0]:
		for y in tile_count[1]:
			set_cell(0, Vector2i(x, y), 0, Vector2i(6,5))
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func mazeGenerate() -> void:
	var rng = RandomNumberGenerator.new()
	print(window.size/ 32)
	#print(rng.randi_range())
