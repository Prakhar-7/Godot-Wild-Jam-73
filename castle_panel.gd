extends Panel

@onready var tower = preload("res://scenes/castle.tscn")
var currTile

var valid_tiles = [Vector2i(10, 0), Vector2i(10, 1), Vector2i(11, 0), Vector2i(11, 1)]
var tower_size = Vector2i(2.5, 2.5)
@onready var error = $error


func _on_gui_input(event):
	var mapPath = get_tree().get_root().get_node("Level 1/TileMap")
	var tile = mapPath.local_to_map(get_global_mouse_position())
		
	currTile = mapPath.get_cell_atlas_coords(0, tile, false)
	var tempTower = tower.instantiate()
	
	var tower_position = mapPath.local_to_map(get_global_mouse_position())
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left Click Down
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		tempTower.global_position = event.global_position
		
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#Left Click Down Drag
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position
		
		
		var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies()
		if can_place_tower(currTile, mapPath):
			get_child(1).get_node("Area").modulate = Color(0,255,0 , 0.1)
		else:
			get_child(1).get_node("Area").modulate = Color(255, 0, 0 , 0.4)
			
			
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		#Left Click up
		#print("Left button up")
		if get_child_count() > 1:
			get_child(1).queue_free()
		
		
		
		if can_place_tower(currTile, mapPath):
			var path = get_tree().get_root().get_node("Level 1/Castles")
			
			path.add_child(tempTower)
			tempTower.global_position = event.global_position
			tempTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()


func can_place_tower(top_left_tile: Vector2i, tilemap: TileMap) -> bool:
	for x in range(tower_size.x):
		for y in range(tower_size.y):
			var tile_position = top_left_tile + Vector2i(x, y)

			# Check if tile is valid
			if tile_position not in valid_tiles:
				return false  # If any tile is invalid, return false

	return true  # All tiles are valid


