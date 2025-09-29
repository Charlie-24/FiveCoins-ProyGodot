extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("Rotacion")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Verifica que el objeto que colisiona esté en el grupo "player"
		body._loselife()
		pass
