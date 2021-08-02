extends Node

var score = 0 setget _set_score


onready var ScoreLabel: Label = $Score


func _ready():
	OS.center_window()
	var save_data: Dictionary = SaveAndLoad.load_data_from_file()
	self.score = save_data.highscore


func _set_score(value):
	score = value
	_update_score_label()


func _on_Ship_player_death():
	_update_save_data()
	yield(get_tree().create_timer(1), "timeout")
	var _e = get_tree().change_scene("res://GameOverScreen.tscn")


func _update_score_label():
	ScoreLabel.text = "Score = " + str(score)


func _update_save_data():
	var save_data:Dictionary = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)









