extends Node2D

const EnemyScene: PackedScene = preload("res://Enemy.tscn")

onready var SpawnPointsNode: Node2D = $SpawnPoints


func _get_spawn_position():
	var points: Array = SpawnPointsNode.get_children()
	points.shuffle()
	return points[0].global_position


func _spawn_enemy():
	# obtenemos la position de cualquier position2D.
	var spawn_position = _get_spawn_position()
	
	var EnemyInstance = EnemyScene.instance()
	EnemyInstance.global_position = spawn_position
	
	var RootNode = get_tree().current_scene	
	RootNode.call_deferred("add_child", EnemyInstance)


func _on_Timer_timeout():
	_spawn_enemy()
