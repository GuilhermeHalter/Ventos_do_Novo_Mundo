extends Control

func _on_btn_jogar_pressed() -> void:
	print("Jogar clicado!")
	# Aqui você pode trocar de cena futuramente
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_btn_opcoes_pressed() -> void:
	print("Opções clicado!")


func _on_btn_sair_pressed() -> void:
	print("Saindo do jogo...")
	get_tree().quit()
