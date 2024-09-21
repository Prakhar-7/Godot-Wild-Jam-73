extends Panel

@onready var tower = preload("res://scenes/castle.tscn")
var currTile


func _on_gui_input(event):
	var tempTower = tower.instantiate()
	print(event)
