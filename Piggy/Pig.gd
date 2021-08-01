extends Area2D

export (int) var SPEED = 50

onready var AnimationPlayerNode: AnimationPlayer = $AnimationPlayer
onready var SpriteNode: Sprite = $Sprite
var moving: bool = false

func _process(delta)->void:
	moving = false
	if Input.is_action_pressed("ui_right"):
		_move(SPEED, 0, delta)
		SpriteNode.flip_h = false
	if Input.is_action_pressed("ui_left"):
		_move(-SPEED, 0, delta)
		SpriteNode.flip_h = true

	if Input.is_action_pressed("ui_up"):
		_move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_down"):
		_move(0, SPEED, delta)

	AnimationPlayerNode.play("Run" if moving else "Idle")

#	var areas: Array = get_overlapping_areas()
#	for area in areas:
#		area.queue_free()

func _move(x_speed: float, y_speed: float, delta: float)->void:
	position.x += x_speed * delta
	position.y += y_speed * delta
	moving = true


func _on_Pig_area_entered(area: Area2D):
	area.queue_free()
	scale *= 1.1
