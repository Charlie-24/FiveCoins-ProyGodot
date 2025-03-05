#movimiento definitivo izquierda y derecha 

extends CharacterBody2D

var ppm : int = 24
var direccion_horizontal : float

var gravedad : float = 9.8 * ppm
var rapidez : float = 3.0 * ppm

const JUMP_VELOCITY = -400.0

func _ready():
	pass

func _input(event):
	calcular_direccion()
	if event.is_action_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func _physics_process(delta):
	# Aplica la gravedad en el eje Y
	velocity.y += gravedad * delta
	# Actualiza la velocidad horizontal
	velocity.x = direccion_horizontal * rapidez
	# Mueve el personaje con las nuevas velocidades
	move_and_slide()

func calcular_direccion():
	direccion_horizontal = Input.get_axis("ui_left", "ui_right")