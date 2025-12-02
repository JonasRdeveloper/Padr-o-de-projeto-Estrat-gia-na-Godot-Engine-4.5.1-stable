# enemy_factory.gd
extends RefCounted
class_name EnemyFactory

var config: EnemyConfig

func _init(enemy_config: EnemyConfig) -> void:
	config = enemy_config

func create_enemy(enemy_type: String, marker: Marker2D) -> Node2D:
	if not config.enemy_scenes.has(enemy_type):
		push_error("Tipo de inimigo não encontrado: %s" % enemy_type)
		return null
	
	var scene_path = config.enemy_scenes[enemy_type]
	var packed_scene: PackedScene = scene_path
	var enemy_instance := packed_scene.instantiate() as Node2D
	# Posiciona o inimigo no Marker3D
	enemy_instance.global_transform = marker.global_transform
	
	return enemy_instance
