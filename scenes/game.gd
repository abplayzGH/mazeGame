extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tilemap = $TileMap

	var mouse :Vector2 = get_global_mouse_position()
	var cell :Vector2 = tilemap.world_to_map(mouse)
	var abc :int = tilemap.get_cellv(cell)
	var new_abc :int = (abc + 1) % 3 # just an example plus 1 modules 3
	tilemap.set_cellv(cell, new_abc)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
