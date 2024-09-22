extends Node2D


var player_health = 10

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

