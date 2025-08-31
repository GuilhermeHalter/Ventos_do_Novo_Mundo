extends CharacterBody2D

@export var speed := 100.0

func _physics_process(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Normaliza o vetor para evitar velocidade maior nas diagonais
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		velocity = input_vector * speed
	else:
		velocity = Vector2.ZERO
	
	# Move o barco
	move_and_slide()

	# Ajusta animação e CollisionShape conforme direção
	if input_vector != Vector2.ZERO:
		var anim = ""
		var shape = $CollisionShape2D.shape
		if input_vector.y < 0:
			if input_vector.x < 0:
				anim = "up_left"
				shape.extents = Vector2(122, 253.262 / 2)  # metade do y
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
