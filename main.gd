extends Node2D

@onready var pause_menu: CanvasLayer = $PauseMenu
@onready var barco = $Ship
@onready var destino_americas = $Continentes/Americas/Marker2D

@export var distancia_minima: float = 100.0

func _input(event):
	if event.is_action_pressed("ui_cancel"): # tecla ESC por padrão
		toggle_pause()

func toggle_pause():
	# alterna o estado de pausa
	get_tree().paused = not get_tree().paused
	pause_menu.visible = get_tree().paused

func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	pause_menu.visible = false

func _on_exit_button_pressed() -> void:
	get_tree().quit()
	
func _process(delta: float) -> void:
	var distancia = barco.global_position.distance_to(destino_americas.global_position)
	if distancia <= distancia_minima:
		_end_game()

func _end_game() -> void:
	# Mudar para tela de fim de jogo
	get_tree().change_scene_to_file("res://scenes/end_game.tscn")

	# ou se preferir reiniciar a Main direto:
	# get_tree().reload_current_scene()
