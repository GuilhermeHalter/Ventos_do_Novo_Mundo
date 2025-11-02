extends Area2D # ✅ Herança correta para colisões

@export var speed: float = 400.0
@export var damage: int = 1

# ❗ NOVO: Variável para receber a direção de tiro do navio (padrão: direita)
var direction: Vector2 = Vector2.RIGHT 

func _ready():
	# Rotaciona a bala para a direção de movimento (opcional, mas visualmente melhor)
	if direction != Vector2.ZERO:
		look_at(global_position + direction)

func _process(delta):
	# Usa a direção passada pelo navio para o movimento
	position += direction * speed * delta
	
	# Destrói a bala se ela sair da área de jogo
	if position.x > 2000 or position.x < -200 or position.y > 2000 or position.y < -200: 
		queue_free()

func _on_body_entered(body):
	# Verifica se o corpo que colidiu pertence ao grupo "enemies"
	if body.is_in_group("enemies"):
		if is_instance_valid(body):
			body.queue_free() # destrói inimigo
		queue_free()      # destrói balaj
