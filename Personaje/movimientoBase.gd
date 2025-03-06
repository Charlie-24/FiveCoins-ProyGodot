#funcion saltar añadida 

extends CharacterBody2D

# Variables de movimiento
@export var speed: float = 200.0
@export var jump_force: float = 400.0
@export var gravity: float = 900.0

# Variables de animación
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Estado del salto
var is_jumping: bool = false

func _ready():
    # Iniciar la animación de idle (reposo)
    animated_sprite.play("idle")

func _process(delta: float) -> void:
    # Aplicar gravedad
    if not is_on_floor():
        velocity.y += gravity * delta
    else:
        is_jumping = false

    # Movimiento horizontal
    var direction: float = 0
    if Input.is_action_pressed("move_left"):  # Tecla A
        direction = -1
    if Input.is_action_pressed("move_right"):  # Tecla D
        direction = 1

    if direction != 0:
        velocity.x = direction * speed
        animated_sprite.play("walk")  # Reproducir animación de caminar
        animated_sprite.flip_h = direction < 0  # Voltear sprite si va a la izquierda
    else:
        velocity.x = 0
        if not is_jumping:
            animated_sprite.play("idle")  # Reproducir animación de reposo

    # Salto
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = -jump_force
        is_jumping = true
        animated_sprite.play("jump")  # Reproducir animación de salto

    # Aplicar movimiento
    move_and_slide()
