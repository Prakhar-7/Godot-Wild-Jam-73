extends CharacterBody2D

var target : Vector2 = Vector2.ZERO
var speed = 1000
var pathName = ""  # Assuming you want to target PathFollow2D
var arrowDamage = 0



func _physics_process(delta):
	var pathSpawnerNode = get_tree().get_root().get_node("Level 1/PathSpawner")
	
	# Iterate through the children of pathSpawnerNode
	for i in range(pathSpawnerNode.get_child_count()):
		var path2DNode = pathSpawnerNode.get_child(i)
		if pathSpawnerNode.get_child(i).name == pathName:  # Check for Path2D nodes
				target = pathSpawnerNode.get_child(i).get_child(0).global_position
	# Check if target is valid before moving the arrow
	velocity = global_position.direction_to(target) * speed
	look_at(target)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.name == "Soldier A":
		body.health -= arrowDamage
		#print("Arrow hit Soldier A! Destroying arrow.")
		queue_free()  # This will remove the arrow from the scene

