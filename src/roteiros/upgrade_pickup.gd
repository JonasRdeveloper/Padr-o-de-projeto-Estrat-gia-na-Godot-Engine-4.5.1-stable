extends Area2D

@export var upgrade_strategy: BaseBulletStrategy

func _on_body_entered(body: Node) -> void:
	if body.has_method("add_strategy"):
		body.add_strategy(upgrade_strategy)
		queue_free()
	
