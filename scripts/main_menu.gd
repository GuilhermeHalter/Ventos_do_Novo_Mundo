extends Control

func _on_btn_jogar_pressed() -> void:
	print("Jogar clicado!")
	
	# Carrega a cutscene (Godot 4 usa 'instantiate()')
	var cutscene_scene = preload("res://scenes/Cutscene.tscn").instantiate()
	add_child(cutscene_scene)
	
	# Toca a animação
	cutscene_scene.get_node("AnimatedSprite2D").play("cutscene_intro")
	
	# Conecta o signal para saber quando a cutscene terminou
	cutscene_scene.get_node("AnimatedSprite2D").connect(
		"animation_finished", 
		Callable(self, "_on_cutscene_finished")
	)


func _on_cutscene_finished():
	# Remove a cutscene da tela
	for child in get_children():
		if child.name == "Cutscene":
			child.queue_free()
	# Troca para a cena do jogo
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_btn_opcoes_pressed() -> void:
	print("Opções clicado!")


func _on_btn_sair_pressed() -> void:
	print("Saindo do jogo...")
	get_tree().quit()
