extends StaticBody2D

var Arrow = preload("res://scenes/Arrow.tscn")
var ArrowDamage = 5
var pathName 
var currTargets = []
var curr


func _on_tower_body_entered(body):
	if "soldier A" in body.name: 
		var tempArray = []
		currTargets = get_node("Tower")


func _on_tower_body_exited(body):
	pass # Replace with function body.
