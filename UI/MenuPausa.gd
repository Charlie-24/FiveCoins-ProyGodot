extends Control

func _input(event):  # Cambié 'func_input' por 'func _input', ya que esta es la función estándar para capturar eventos.
	if event.is_action_pressed("pause"):  # 'is_action_pressed' está mal escrito como 'is_action_presed'.
		print("Juego Pausado")
		visible = not get_tree().paused
		get_tree().paused = not get_tree().paused  # Esto es correcto para alternar la pausa.

func _on_button_pressed() -> void:
	print("Vuelta al Menu")
	visible = not get_tree().paused
	get_tree().paused = not get_tree().paused  
	get_tree().change_scene_to_file("res://objetos/menu.tscn")
