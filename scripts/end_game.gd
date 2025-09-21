extends Control

func _ready() -> void:
	$VBoxContainer/Reiniciar.connect("pressed", Callable(self, "_on_reiniciar_pressed"))
	$VBoxContainer/Sair.connect("pressed", Callable(self, "_on_sair_pressed"))

func _on_reiniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")  # volta para a cena principal

func _on_sair_pressed() -> void:
	get_tree().quit()  # fecha o jogo
