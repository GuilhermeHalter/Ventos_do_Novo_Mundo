extends Node2D

@export var speed: float = 100.0
@export var move_range: float = 200.0
var direction := 1
var start_x: float

func _ready():
	start_x = position.x

func _process(delta):
	position.x += direction * speed * delta
	
	# Faz o inimigo ir pra frente e pra trás
	if abs(position.x - start_x) > move_range:
		direction *= -1
		$Sprite2D.flip_h = direction < 0
