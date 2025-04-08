extends CharacterBody2D

# Variables de movimiento
@export var speed: float = 90.0
@export var gravity: float = 900.0

# Variables de animación
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	# Iniciar la animación de idle (reposo)
	animated_sprite.play("Caminar")

func _process(delta: float) -> void:
	move_caracter()

func move_caracter():
	# Aplicar gravedad
	velocity.y += gravity  # Aplicar gravedad de forma independiente del frame
	velocity.x = -speed  # Velocidad horizontal (puedes ajustarlo según lo que necesites)
	
	# Mover el nodo con el vector de velocidad
	move_and_slide()

func _loselife():
	# Código para perder vida
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Verifica que el objeto que colisiona esté en el grupo "player"
		body._loselife()
		pass
