extends Panel

@onready var tower = preload("res://scenes/castle.tscn")
var currTile


func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		print("Left Button Down")
	elif event is InputEventMouseButton and event.button_mask == 0:
		print("Left Button Up")
		
		
