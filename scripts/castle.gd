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
		
		for i in currTargets:
			if "soldier" in i.name:
				tempArray.append(i)
				
		var currTarget = null
		
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		
		curr = currTarget
		pathName = currTarget.get_parrent().name
		
		var tempArrow = Arrow.instantiate()
		tempArrow.pathName = pathName
		tempArrow.ArrowDamage = ArrowDamage
		get_node("ArrowContainer").add_child(tempArrow)
		tempArrow.global_position = $Aim.global_position
		
		
func _on_tower_body_exited(body):
	pass # Replace with function body.
