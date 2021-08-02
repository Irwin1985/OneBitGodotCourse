extends Area2D

const ExplosionScene: PackedScene = preload("res://ExplisionEffect.tscn")

export (int) var Speed = 20
export (int) var Armour = 3


func _process(delta):
	position.x -= Speed * delta


func _on_Enemy_body_entered(body):
	# eliminamos la bala (RigidBody2D)
	body.queue_free()
	# perdemos una vida
	Armour -= 1
	if Armour <= 0:
		_add_to_score()
		_create_explosion()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _create_explosion():
	var RootNode = get_tree().current_scene
	
	var ExplosionInstance = ExplosionScene.instance()
	ExplosionInstance.global_position = global_position
	
	RootNode.call_deferred("add_child", ExplosionInstance)

func _add_to_score():
	var NodeRoot = get_tree().current_scene
	if NodeRoot.is_in_group("World"):
		NodeRoot.score += 10	
