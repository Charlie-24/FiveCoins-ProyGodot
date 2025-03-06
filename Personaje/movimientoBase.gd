
#Animacion Caminar implementada

extends CharacterBody2D

# Variables de movimiento
@export var speed: float = 200.0
@export var jump_force: float = 400.0
@export var gravity: float = 900.0

# Variables de animación
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D  # Referencia a la cámara

# Estado del salto
var is_jumping: bool = false

func _ready():
	# Iniciar la animación de idle (reposo)
	animated_sprite.play("Caminar")

func _process(delta: float) -> void:
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		is_jumping = false

	# Movimiento horizontal
	var direction: float = Input.get_axis("move_left", "move_right")  # Mejora de código
	if direction != 0:
		velocity.x = direction * speed
		animated_sprite.play("walk")
		animated_sprite.flip_h = direction < 0
	else:
		velocity.x = 0
		if not is_jumping:
			animated_sprite.play("idle")

	# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		is_jumping = true
		animated_sprite.play("jump")

	# Aplicar movimiento
	move_and_slide()
