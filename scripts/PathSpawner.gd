extends Node


@onready var path = preload("res://Mobs/Stage_1.tscn")
func _on_timer_timeout():
	var tempath = path.instantiate()
	add_child(tempath)


func _on_back_pressed():
	pass # Replace with function body.
