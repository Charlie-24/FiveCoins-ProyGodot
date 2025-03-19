extends CanvasLayer

var coins = 0

func _ready() -> void:
	# Actualiza el contador de monedas al inicio
	$CoinsCollector.text = str(coins)
	
	# Conectamos la señal "coin_collected" de todas las monedas del grupo "coins"
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.connect("coin_collected", Callable(self, "_on_coin_collected"))

# Método que se llama cuando se recoge una moneda
func _on_coin_collected() -> void:
	print("Coin Collected")
	coins += 1
	$CoinsCollector.text = str(coins)