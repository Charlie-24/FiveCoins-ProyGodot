# movimiento definitivo con animaciones incluidas
extends CharacterBody2D

# Variables de movimiento
@export var speed: float = 120.0
@export var jump_force: float = 300.0
@export var gravity: float = 900.0

# Variables de animación
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D  # Referencia a la cámara

# Estado del salto
var is_jumping: bool = false

func _process(delta: float) -> void:
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		is_jumping = false

	# Movimiento horizontal
	var direction: float = Input.get_axis("move_left", "move_right")  # Mejora de código
	velocity.x = direction * speed

	# Animaciones de caminar y idle
	if direction != 0:
		velocity.x = direction * speed
		animated_sprite.play("Caminar")  # Reproducir la animación "Caminar"
		animated_sprite.flip_h = direction < 0
		
	else:
		velocity.x = 0
		# Si el personaje no se mueve, reproducir la animación "idle"
		animated_sprite.play("Quieto")  # Reproducir la animación "idle"
		
	# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor() :
		velocity.y = -jump_force
		is_jumping = true
		# Reproducir la animación de salto
	
	if not is_on_floor() :
		animated_sprite.play("Saltar")		

	# Aplicar movimiento
	move_and_slide()

