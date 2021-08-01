extends Node

onready var AnimationPlayerNode: AnimationPlayer = $"AnimationPlayer"

func _ready():
	OS.center_window()


func _on_LaunchButton_pressed():
	AnimationPlayerNode.play("Lauch")
