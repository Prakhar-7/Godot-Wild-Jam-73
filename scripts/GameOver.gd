extends Control

@onready var click = $click




	
	


func _on_quit_pressed():
	get_tree().quit()


func _on_main_menu_pressed():
	click.play()
	await get_tree().create_timer(1.0).timeout

	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
