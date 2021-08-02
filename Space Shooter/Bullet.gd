extends RigidBody2D

const HitEffectScene: PackedScene = preload("res://HitEffect.tscn")

func _ready():
	OS.center_window()


func _on_VisibilityNotifier2D_screen_exited():
	# eliminamos la bala al salir de la pantalla 
	_create_hit_effect()
	queue_free()


func _create_hit_effect():
	var RootNode = get_tree().current_scene
	var HitEffectInstance = HitEffectScene.instance()
	HitEffectInstance.global_position = global_position
	RootNode.call_deferred("add_child", HitEffectInstance)
