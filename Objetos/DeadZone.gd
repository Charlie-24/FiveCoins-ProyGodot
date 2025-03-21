extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.get_name()=="Personaje":
		print ("Hemos caido")
		get_tree().reload_current_scene()
		pass # Replace with function body.