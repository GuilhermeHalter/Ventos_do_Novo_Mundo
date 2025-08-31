extends Node

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var fade: ColorRect = $Fade  # agora o fade está dentro da cutscene
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	# Fade começa totalmente preto
	fade.modulate.a = 1.0

	# Toca a animação e o áudio da cutscene
	anim_sprite.play("cutscene_intro")
	if audio:
		audio.play()

	# Conecta fim da animação
	anim_sprite.connect("animation_finished", Callable(self, "_on_cutscene_finished"))

	# Fade-in da cutscene
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, 1.0)

func _on_cutscene_finished():
	# Fade-out antes de ir para o jogo
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 1.0)
	tween.finished.connect(_goto_game)

func _goto_game() -> void:
	# Troca para a cena do jogo
	get_tree().change_scene_to_file("res://Main.tscn")
