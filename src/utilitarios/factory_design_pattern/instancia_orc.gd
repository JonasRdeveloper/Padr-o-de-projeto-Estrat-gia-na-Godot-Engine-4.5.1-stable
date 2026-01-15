class_name Instancia_orc extends Interface_factory

@export var health: int = 40
@export var speed: float = 50.0

@onready var rotulo_saude := $Orc/Rotulo_saude as Label
@onready var explosao := $Explosao as CPUParticles2D
@onready var sprite_2d := $Orc/Sprite2D as Sprite2D

func _physics_process(delta):
	self.position += Vector2.RIGHT * speed * delta

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
		await get_tree().create_timer(0.5).timeout
		self.queue_free()
