extends Panel

@onready var tower = preload("res://scenes/castle.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left Click Down
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		tempTower.scale = Vector2(0.10,0.10)
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#Left Click Down Drag
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position
			
	elif event is InputEventMouseButton and event.button_mask == 0:
		#Left Click up
		#print("Left button up")
		if get_child_count() > 1:
			get_child(1).queue_free()
		var path = get_tree().get_root().get_node("Level 1/Castle")
		
		path.add_child(tempTower)
		tempTower.global_position = event.global_position
		tempTower.get_node("Tower").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
