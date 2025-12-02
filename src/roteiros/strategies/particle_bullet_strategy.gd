class_name ParticleBulletStrategy
extends BaseBulletStrategy

@export var particle_scene: PackedScene

func apply_upgrade(bullet: Node) -> void:
	var particles = particle_scene.instantiate()
	bullet.add_child(particles)
	particles.global_position = bullet.global_position
	
