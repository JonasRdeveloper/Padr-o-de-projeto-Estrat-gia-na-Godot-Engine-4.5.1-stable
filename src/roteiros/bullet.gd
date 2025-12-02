class_name Bala2D extends Area2D

@export var damage: int = 5
@export var speed: float = 400.0
var piercing: bool = false

func _process(delta: float) -> void:
	position += Vector2.RIGHT * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(&'inimigos') and body.has_method(&"take_damage"):
		print_debug("Este corpo é: ", body)
		var corpo := body
		corpo.take_damage(damage)

		# Se não for perfurante, o projétil desaparece
		if not piercing:
			queue_free()
