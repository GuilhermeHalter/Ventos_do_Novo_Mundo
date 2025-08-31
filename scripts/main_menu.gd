extends Control

@onready var fade: ColorRect = $Fade

func _ready():
	# Fade começa transparente
	fade.modulate.a = 0.0

func _on_btn_jogar_pressed() -> void:
	print("Jogar clicado!")

	if has_node("AudioStreamPlayer"):
		$AudioStreamPlayer.stop()
	
	# Fade-out do menu e depois inicia a cutscene
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 1.0)
	tween.finished.connect(_start_cutscene)

func _start_cutscene():
	# Carrega a cena da cutscene
	var cutscene_scene = preload("res://scenes/Cutscene.tscn").instantiate()
	cutscene_scene.name = "Cutscene"
	add_child(cutscene_scene)
