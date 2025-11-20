class_name SpeedBulletStrategy
extends BaseBulletStrategy

@export var speed_increase: float = 200.0

func apply_upgrade(bullet: Node) -> void:
	bullet.speed += speed_increase
