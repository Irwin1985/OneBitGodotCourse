extends Node


onready var HighscoreLabel: Label = $HighscoreLabel


func _ready():
	OS.center_window()
	set_highscore_label()


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		var _e = get_tree().change_scene("res://StartMenu.tscn")


func set_highscore_label():
	var save_data = SaveAndLoad.load_data_from_file()
	HighscoreLabel.text = "Highscore : " + str(save_data.highscore)
