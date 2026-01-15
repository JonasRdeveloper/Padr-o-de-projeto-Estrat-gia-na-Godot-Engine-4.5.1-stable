extends Node2D

var factory: EnemyFactory

@onready var spawn_points := {
	"goblin": [
		$PosicoesInimigos/GoblinSpawn,
	],
	"orc": [
		$PosicoesInimigos/OrcSpawn,
	]
}

func _ready() -> void:
	var config: EnemyConfig = load("res://src/utilitarios/factory_design_pattern/enemy_config.tres")
	factory = EnemyFactory.new(config)

	for enemy_type in spawn_points.keys():
		for marker in spawn_points[enemy_type]:
			var enemy = factory.create_enemy(enemy_type, marker)
			call_deferred("add_child", enemy)
			enemy.ataque()
			enemy.movimento()
