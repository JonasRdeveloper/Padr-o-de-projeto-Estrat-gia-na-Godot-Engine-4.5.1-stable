class_name DamageBulletStrategy
extends BaseBulletStrategy

signal dano_causado(dano: int)

@export var extra_damage: int = 5

func apply_upgrade(bullet: Node) -> void:
	bullet.damage += extra_damage
	dano_causado.emit(bullet.damage)
