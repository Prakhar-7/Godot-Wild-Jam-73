extends Node2D


var player_health = 10
@onready var music = $Music

func _ready():
	music.play()
