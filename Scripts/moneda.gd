extends Node2D

signal coin_collected  # Declaramos la señal

# Se conecta el "body_entered" en el _ready()
func _ready():
	add_to_group("coins")  # Agregar la moneda al grupo "coins"

	# Asegúrate de que la señal se conecta
	connect("body_entered", Callable(self, "_on_body_entered"))

# Este método se ejecuta cuando el jugador colisiona con la moneda
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("coin_collected")  # Emitir la señal cuando la moneda es recogida
		$AudioStreamPlayer.playing = true  # Reproducir el sonido

		# Usamos un Timer para esperar 0.1 segundos
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 0.1
		timer.one_shot = true
		timer.start()

		# Esperamos a que termine el timer
		await timer.timeout  # Espera hasta que el timer se complete
		queue_free()  # Eliminar la moneda