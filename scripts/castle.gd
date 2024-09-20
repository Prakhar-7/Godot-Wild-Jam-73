extends StaticBody2D

var Arrow = preload("res://scenes/Arrow.tscn")
var ArrowDamage = 5
var pathName 
var currTargets = []
var curr

func _on_tower_body_entered(body):
	if "Soldier A" in body.name: 
		print("body entered")
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()  # Get overlapping bodies
		
		# Collect all targets whose name contains "soldier"
		for i in currTargets:
			if "Soldier" in i.name:
				tempArray.append(i)
				print(i.name)
		
		var currTarget = null
		
		# Choose the target based on progress
		for i in tempArray:
			print(i.get_parent())
			var parent_node = i.get_parent()  # Get the parent node
			if parent_node and parent_node.has_method("get_progress"):  # Ensure method exists
				if currTarget == null:
					currTarget = parent_node
				else:
					if parent_node.get_progress() > currTarget.get_progress():
						currTarget = parent_node
		
		if currTarget != null:
			pathName = currTarget.name
			curr = currTarget
			
			# Instantiate and configure the arrow
			var tempArrow = Arrow.instantiate()
			print("Arrow instantiated")
			tempArrow.pathName = pathName
			tempArrow.ArrowDamage = ArrowDamage
			get_node("ArrowContainer").add_child(tempArrow)
			tempArrow.global_position = $Aim.global_position
		else:
			print("No valid target found")
		

func _on_tower_body_exited(body):
	pass
