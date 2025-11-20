extends Area2D

@export var damage: int = 5
@export var speed: float = 400.0
var piercing: bool = false

func _process(delta: float) -> void:
	position += Vector2.RIGHT * speed * delta
	
