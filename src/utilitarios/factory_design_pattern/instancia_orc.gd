class_name Instancia_orc extends Interface_factory

@export var health: int = 40

@onready var rotulo_saude := $Orc/Rotulo_saude as Label


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
		queue_free()
