extends StaticBody2D

var Arrow = preload("res://scenes/Arrow.tscn")
var ArrowDamage = 2
var pathName 
var currTargets = []
var curr
@onready var bow = $Archer/Bow

func _process(delta):
	if is_instance_valid(curr):
		var archer = $Archer  # Adjust the path to Archer node based on the structure
		archer.look_at(curr.global_position)
	else:
		for i in get_node("ArrowContainer").get_child_count():
			get_node("ArrowContainer").get_child(i).queue_free()

func _on_tower_body_entered(body):
	if "Soldier A" in body.name: 
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()  # Get overlapping bodies
		
		# Collect all targets whose name contains "soldier"
		for i in currTargets:
			if "Soldier" in i.name:
				tempArray.append(i)
		
		var currTarget = null
		bow.play()
		# Choose the target based on progress
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
						currTarget = i.get_node("../")
		
		curr = currTarget
		pathName = currTarget.get_parent().name
		
		# Instantiate and configure the arrow
		var tempArrow = Arrow.instantiate()
		tempArrow.pathName = pathName
		tempArrow.arrowDamage = ArrowDamage
		get_node("ArrowContainer").add_child(tempArrow)
		tempArrow.global_position =$Archer/Aim.global_position
		

func _on_tower_body_exited(body):
	pass
