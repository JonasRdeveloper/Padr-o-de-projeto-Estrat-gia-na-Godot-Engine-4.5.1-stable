class_name Instancia_goblin
extends Interface_factory

@export var health: int = 20

@onready var rotulo_saude := $Goblin/Rotulo_saude as Label
@onready var explosao := $Explosao as CPUParticles2D
@onready var sprite_2d := $Goblin/Sprite2D as Sprite2D



func _ready():
	rotulo_saude.set_text(str(health))

func ataque() -> void:
	pass
	#print("Goblin ataca com uma clava!")
	
func movimento() -> void:
	pass
	#print("Goblin corre rapidamente.")

func take_damage(amount: int) -> void:
	health -= amount
	rotulo_saude.text = "HP: %d" % health
	if health <= 0:
		explosao.set_emitting(true)
		sprite_2d.set_modulate(Color(0.0, 0.0, 0.0, 0.0))
		$CollisionShape2D.call_deferred(&"set_disabled", true)
		await get_tree().create_timer(1.0).timeout
		self.queue_free()
		
