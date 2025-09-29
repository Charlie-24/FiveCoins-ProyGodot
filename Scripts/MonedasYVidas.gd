extends CanvasLayer

var coins = 0

var Corazon1
var Corazon2
var Corazon3

func _ready() -> void:
	Corazon1 = get_node("Corazon1")
	Corazon2 = get_node("Corazon2")
	Corazon3 = get_node("Corazon3")
	
	# Actualiza el contador de monedas al inicio
	$CoinsCollector.text = str(coins)
	
	# Conectamos la señal "coin_collected" de todas las monedas del grupo "coins"
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.connect("coin_collected", Callable(self, "_on_coin_collected"))

# Método que se llama cuando se recoge una moneda
func _on_coin_collected() -> void:
	print("Moneda recogida")
	coins += 1
	$CoinsCollector.text = str(coins)
	
	# Reiniciar la escena si se recogen 5 monedas
	if coins == 5:
		print("¡Cinco monedas recogidas!")  # Mensaje de depuración
		
		var congratulations_menu = get_node("/root/Escenario1/CanvasLayer/CongratulationsMenu")  
		congratulations_menu.visible = true	
		

func handleHearts(lifes: int) -> void:
	if lifes == 0:
		Corazon1.visible = false
	if lifes == 1:
		Corazon2.visible = false
	if lifes == 2:
		Corazon3.visible = false
