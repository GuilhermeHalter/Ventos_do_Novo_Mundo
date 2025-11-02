extends CharacterBody2D

# Propriedades de Movimento
@export var speed := 100.0

# Propriedades de Tiro
@export var bullet_scene: PackedScene # Arrastar a cena Bullet.tscn aqui no Inspector
@onready var fire_point = $Marker2D # Ponto de onde o tiro é instanciado

# ⏱️ PROPRIEDADES DE COOLDOWN
@export var fire_rate: float = 0.5 # Tempo de espera (em segundos) entre os tiros
var can_shoot: bool = true # Flag para controlar se o jogador pode atirar

func _ready():
	# Lógica de posicionamento inicial
	var portugal_port = get_tree().current_scene.get_node("Continentes/Portugal/Marker2D")
	if portugal_port:
		global_position = portugal_port.global_position
	else:
		push_warning("⚠️ Não encontrei 'Continentes/Portugal/Marker2D'!")

func _physics_process(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# 🏹 Lógica de Tiro com Cooldown
	if Input.is_action_just_pressed("shoot") and can_shoot:
		# ✅ ADICIONAMOS UM PRINT PARA DEBUG - VEJA O OUTPUT SE NÃO FUNCIONAR!
		print("Ação 'shoot' detectada. Tentando atirar...")
		shoot()
		
	# --- Lógica de Movimento ---
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		velocity = input_vector * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

	# --- Animação e Colisão ---
	# (Seu bloco de animação e colisão, mantido inalterado)
	if input_vector != Vector2.ZERO:
		var anim = ""
		var shape = $CollisionShape2D.shape
		
		# Lógica de animação...
		if input_vector.y < 0:
			if input_vector.x < 0:
				anim = "up_left"
				shape.extents = Vector2(122, 253.262 / 2)
				$CollisionShape2D.rotation_degrees = 130.9
				$CollisionShape2D.position = Vector2(-1, 17)
			elif input_vector.x > 0:
				anim = "up_right"
				shape.extents = Vector2(122, 253.262 / 2)
				$CollisionShape2D.rotation_degrees = 218.2
				$CollisionShape2D.position = Vector2(7, 12)
			else:
				anim = "up"
				shape.extents = Vector2(122, 238 / 2)
				$CollisionShape2D.rotation_degrees = 0
				$CollisionShape2D.position = Vector2(0,0)
		elif input_vector.y > 0:
			if input_vector.x < 0:
				anim = "down_left"
				shape.extents = Vector2(122, 253.262 / 2)
				$CollisionShape2D.rotation_degrees = 218.2
				$CollisionShape2D.position = Vector2(7, 12)
			elif input_vector.x > 0:
				anim = "down_right"
				shape.extents = Vector2(122, 253.262 / 2)
				$CollisionShape2D.rotation_degrees = 130.9
				$CollisionShape2D.position = Vector2(-1, 17)
			else:
				anim = "down"
				shape.extents = Vector2(240, 105 / 2)
				$CollisionShape2D.rotation_degrees = 0
				$CollisionShape2D.position = Vector2(0,0)
		else:
			if input_vector.x < 0:
				anim = "left"
				shape.extents = Vector2(240, 105 / 2)
				$CollisionShape2D.rotation_degrees = 0
				$CollisionShape2D.position = Vector2(0,0)
			elif input_vector.x > 0:
				anim = "right"
				shape.extents = Vector2(240, 105 / 2)
				$CollisionShape2D.rotation_degrees = 0
				$CollisionShape2D.position = Vector2(0,0)
		
		$AnimatedSprite2D.animation = anim
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

# 💣 Função de Atirar (Cannhão)
func shoot():
	if not bullet_scene:
		push_warning("⚠️ bullet_scene não está configurada! Arraste a cena Bullet.tscn no Inspector.")
		return
	
	can_shoot = false
	
	var bullet = bullet_scene.instantiate()
	
	# ❗ ESSENCIAL: Passa a direção do tiro para a bala
	var fire_direction = velocity.normalized()
	if fire_direction != Vector2.ZERO:
		bullet.direction = fire_direction
	else:
		# Se o navio está parado, a bala usa a direção da última animação (input_vector)
		# Ou definimos uma direção padrão (ex: direita)
		bullet.direction = Vector2.RIGHT 
		
	bullet.global_position = fire_point.global_position
	get_tree().current_scene.add_child(bullet)
	
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = fire_rate
	timer.timeout.connect(reset_cooldown.bind(timer)) 
	add_child(timer)
	timer.start()

# 🔄 Função: Reinicia o Cooldown
func reset_cooldown(timer: Timer):
	can_shoot = true
	if is_instance_valid(timer):
		timer.queue_free()
