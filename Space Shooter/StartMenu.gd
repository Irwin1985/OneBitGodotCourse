extends Node

func _ready():
	OS.center_window()



func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		# llamar a la escena del juego.
		var _e = get_tree().change_scene("res://World.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
