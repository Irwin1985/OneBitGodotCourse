extends Area2D

export (int) var Speed = 100

const BulletScene: PackedScene = preload("res://Bullet.tscn")
const ExplosionScene: PackedScene = preload("res://ExplisionEffect.tscn")

signal player_death


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= Speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += Speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		_fire_bullet()


func _fire_bullet():
	# creamos la instancia de la bala (BulletInstance)
	var BulletInstance = BulletScene.instance()
	# recuperamos el root principal (OJO: no es la mejor manera)
	var NodeRoot = get_tree().current_scene
	# agregamos la instancia de la bala en la escena principal.
	NodeRoot.call_deferred("add_child", BulletInstance)
	# por último seteamos la posición de la bala
	# usamos global_position en lugar de position porque
	BulletInstance.global_position = global_position


func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()


func _exit_tree():
	var RootNode = get_tree().current_scene
	
	var ExplosionInstance = ExplosionScene.instance()
	ExplosionInstance.global_position = global_position
	
	RootNode.call_deferred("add_child", ExplosionInstance)
	# emitir la señal "player_death"
	emit_signal("player_death")
