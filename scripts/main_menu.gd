extends Control

func _on_btn_jogar_pressed() -> void:
	print("Jogar clicado!")

	# Para a música do menu (se houver um AudioStreamPlayer aqui)
	if has_node("AudioStreamPlayer"):
		$AudioStreamPlayer.stop()
	
	# Carrega a cutscene (Godot 4 usa 'instantiate()')
	var cutscene_scene = preload("res://scenes/Cutscene.tscn").instantiate()
	add_child(cutscene_scene)
	
	# Toca a animação
	var anim_sprite = cutscene_scene.get_node("AnimatedSprite2D")
	anim_sprite.play("cutscene_intro")

	# Se a cutscene tiver sua própria música, toca
	if cutscene_scene.has_node("AudioStreamPlayer"):
		cutscene_scene.get_node("AudioStreamPlayer").play()
	
	# Conecta o signal para saber quando a cutscene terminou
	anim_sprite.connect(
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
