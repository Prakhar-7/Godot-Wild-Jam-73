extends Panel

@onready var tower = preload("res://scenes/castle.tscn")
var currTile


func _on_gui_input(event):
	#print(event.button_index)
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_index == 1:
		#print("Left button down")
	elif event is InputEventMouseMotion and event.button_mask == 0:
		#print("Left button up")
