extends Node2D

signal coin_collected  # Declaramos la señal

func _ready():
	add_to_group("coins")  # Agregar la moneda al grupo "coins"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Verifica que el objeto que colisiona esté en el grupo "player"
		emit_signal("coin_collected")  # Emitimos la señal
		queue_free()  # Eliminamos la moneda tras ser recogida
