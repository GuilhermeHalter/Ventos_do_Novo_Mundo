extends Node

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var fade: ColorRect = $Fade
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var skip_button: Button = $SkipButton

var cutscene_playing = true

func _ready():
	# Fade inicial
	fade.modulate.a = 1.0

	# Toca animação e áudio
	anim_sprite.play("cutscene_intro")
	if audio:
		audio.play()

	# Conecta sinal de fim da animação
	anim_sprite.connect("animation_finished", Callable(self, "_on_cutscene_finished"))

	# Fade-in da cutscene
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, 1.0)

	# Botão invisível no começo
	skip_button.visible = false
	skip_button.pressed.connect(Callable(self, "_skip_cutscene"))

	# Ativa input para mostrar botão de skip
	set_process_input(true)

func _input(event):
	if not cutscene_playing:
		return

	if event is InputEventKey and event.pressed:
		if event.is_action("ui_accept") or event.is_action("ui_cancel"):
			# Mostra o botão de skip se ainda não estiver visível
			if not skip_button.visible:
				skip_button.visible = true
			else:
				_skip_cutscene()

func _skip_cutscene():
	if not cutscene_playing:
		return

	cutscene_playing = false
	set_process_input(false)

	# Para animação e áudio
	anim_sprite.stop()
	if audio:
		audio.stop()

	# Fade-out antes de ir para o jogo
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 0.5)
	tween.finished.connect(func() -> void:
		_goto_game()
	)

func _on_cutscene_finished():
	if cutscene_playing:
		_skip_cutscene()

func _goto_game() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")
