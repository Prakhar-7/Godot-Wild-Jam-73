extends StaticBody2D

var Arrow = preload("res://scenes/Arrow.tscn")
var ArrowDamage = 5
var pathName 
var currTargets = []
var curr

func _on_tower_body_entered(body):
	if "Soldier A" in body.name: 
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()  # Get overlapping bodies
		
		# Collect all targets whose name contains "soldier"
		for i in currTargets:
			if "Soldier" in i.name:
				tempArray.append(i)
		
		var currTarget = null
		
		# Choose the target based on progress
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
						currTarget = i.get_node("../")
		
		curr = currTarget
		print(curr.get_parent().name)
		pathName = currTarget.get_parent().name
		
		# Instantiate and configure the arrow
		var tempArrow = Arrow.instantiate()
		tempArrow.pathName = pathName
		tempArrow.arrowDamage = ArrowDamage
		get_node("ArrowContainer").add_child(tempArrow)
		tempArrow.global_position = $Aim.global_position
		

func _on_tower_body_exited(body):
	pass
