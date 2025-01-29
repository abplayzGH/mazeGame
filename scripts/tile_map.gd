extends TileMap
@onready var window : Window = get_window()

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	var WINDOW_SIZE = window.size
	var tile_count = WINDOW_SIZE / 32
	for x in tile_count[0]:
		for y in tile_count[1]:
			set_cell(0, Vector2i(x, y), 0, Vector2i(6,5))
	mazeGenerate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#1. Create a grid of cells, with walls between each cell.
#2. Start at a random cell and push it onto the stack.
#3. While the stack is not empty:
   #a. Pop the current cell from the stack.
   #b. Mark the current cell as visited.
   #c. Find all unvisited neighbors.
   #d. If there are unvisited neighbors:
	  #i. Choose one at random.
	  #ii. Remove the wall between the current cell and the chosen neighbor.
	  #iii. Push the current cell onto the stack.
	  #iv. Move to the neighbor (push it onto the stack).

func mazeGenerate() -> void:
	
	var stack: Array[Vector2i]
	var visted: Array[Vector2i]
	#Grid
	var WINDOW_SIZE = window.size
	var tile_count = WINDOW_SIZE / 32
	
	#Random starting tile
	var rng = RandomNumberGenerator.new()
	var startingTile: Vector2i = Vector2i(rng.randi_range(0, tile_count[0]), rng.randi_range(0, tile_count[1]))
	print("Starting Tile ", startingTile)
	
	stack.append(startingTile)
	
	while stack.size() != 0:
		print("Stack ", stack)
		var neighbors: Array[Vector2i]
		var current = stack.pop_front()
		
		visted.append(current)
		
		print("Visted ", visted)
		print("Current ", current)
		
		var left: Vector2i = Vector2i(current[0] - 1, current[1])
		var right: Vector2i = Vector2i(current[0] + 1, current[1])
		var up: Vector2i = Vector2i(current[0], current[1] + 1)
		var down: Vector2i = Vector2i(current[0], current[1] - 1)
		
		if left not in visted:
			neighbors.append(left)
		if right not in visted:
			neighbors.append(right)
		if up not in visted:
			neighbors.append(up)
		if down not in visted:
			neighbors.append(down)
		
		print("neighbors ", neighbors)
		
		if neighbors.size() != 0:
			var next: Vector2i = neighbors[rng.randi_range(0, neighbors.size()-1)]
			set_cell(0, next, 0, Vector2i(8,0))
			stack.append(next)
		else:
			print("Done? ")
			
			
func is_within_bounds(cell: Vector2i) -> bool:
	var WINDOW_SIZE = window.size
	var tile_count = WINDOW_SIZE / 32
	return cell.x > 0 and cell.x < tile_count[0] - 1 and cell.y > 0 and cell.y < tile_count[1] - 1
	
	
	
	
