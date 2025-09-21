extends Control

@onready var fade: ColorRect = $Fade
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	# Fade começa transparente
	fade.modulate.a = 0.0

func _on_btn_jogar_pressed() -> void:
	print("Jogar clicado!")

	if audio:
		audio.stop()
	
	# Fade-out do menu antes de ir para a cutscene
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 1.0)
	tween.finished.connect(_start_cutscene)

func _on_btn_sair_pressed() -> void:
	get_tree().quit()
	

func _start_cutscene():
	# Troca de cena diretamente para a cutscene
	get_tree().change_scene_to_file("res://scenes/Cutscene.tscn")
