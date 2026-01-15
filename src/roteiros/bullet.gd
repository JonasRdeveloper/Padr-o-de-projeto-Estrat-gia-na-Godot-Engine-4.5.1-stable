class_name Bala2D extends Area2D

@export var damage: int = 5
@export var speed: float = 400.0

var vetor_de_movimento := Vector2.RIGHT

func _process(delta: float) -> void:
	position += Vector2.RIGHT * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(&'inimigos') and body.has_method(&"take_damage"):
		var corpo: CharacterBody2D = body
		corpo.take_damage(damage)
		queue_free()
