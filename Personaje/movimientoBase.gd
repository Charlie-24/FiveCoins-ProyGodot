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
	var direction: float = Input.get_axis("move_left", "move_right")  
	var run_multiplier: float = 1.35 if Input.is_action_pressed("Run") else 1.0
	
	velocity.x = direction * speed * run_multiplier

# Animaciones de caminar y predeterminada
	if direction != 0:
		animated_sprite.play("Caminar")  
		animated_sprite.flip_h = direction < 0
		animated_sprite.speed_scale = 1.35 if run_multiplier > 1.0 else 1.0  # Ajusta la velocidad de la animación
		
	else:
		velocity.x = 0
		animated_sprite.play("Quieto")  
		animated_sprite.speed_scale = 1.0  

# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		is_jumping = true
	
	if not is_on_floor():
		animated_sprite.play("Saltar")		

# Aplicar movimiento
	move_and_slide()
	
#Daño Sierra	

func _loselife():
	print("Nos hemos cortado, perdemos vida o reiniciamos nivel")
	get_tree().reload_current_scene()
	pass
	
#Daño Pinchos

func _on_pinchos_body_entered(body: Node2D) -> void:
	if body.get_name()=="Personaje":
		print ("Nos hemos pinchado")
		get_tree().reload_current_scene()
		pass # Replace with function body.

