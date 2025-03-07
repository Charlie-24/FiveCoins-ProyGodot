extends CanvasLayer

var coins = 0

func _ready() -> void:
	
	var coinNode = get_tree().get_root().find_node("Coin2D",true,false)
	coinNode.connect("coinCollected",self,"handleCoinCollected")
	$CoinsCollector.text = str(coins)
	
func handleCoinCollected():
	print("Coin Collected")
	coins+=1
	$CoinsCollector.text = str(coins)
