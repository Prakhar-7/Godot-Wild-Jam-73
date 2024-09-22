extends Label


func _process(delta):
	self.text = "Health: " + str(Game.Health)
	
	if Game.Health <= 0:
		get_tree().change_scene_to_file("res://scenes/GameOver.tscn")
		
