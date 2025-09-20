extends Node2D

@onready var pause_menu: CanvasLayer = $PauseMenu

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
