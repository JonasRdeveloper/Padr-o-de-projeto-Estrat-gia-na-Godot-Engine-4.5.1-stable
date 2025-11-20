extends CharacterBody2D

@export var bullet_scene: PackedScene

@onready var marca2D := get_node("Marca2D") as Marker2D
@onready var dano_label := get_node("HUD/DanoLabel") as Label

var bullet_strategies: Array[BaseBulletStrategy] = []

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.global_position = get_global_mouse_position()
	
	if event.is_action_pressed("ui_accept"):
		shoot()

func shoot() -> void:
	var bullet := bullet_scene.instantiate()
	bullet.global_position = marca2D.global_position
	get_tree().current_scene.add_child(bullet) 

	for strategy in bullet_strategies:
		strategy.apply_upgrade(bullet)

func add_strategy(strategy: BaseBulletStrategy) -> void:
	bullet_strategies.append(strategy)

	if strategy.has_signal("dano_causado"):
		strategy.connect("dano_causado", Callable(self, "_on_dano_causado"))

func _on_dano_causado(novo_dano: int) -> void:
	dano_label.text = "Dano: %d" % novo_dano
