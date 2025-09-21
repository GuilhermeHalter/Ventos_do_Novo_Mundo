extends CanvasLayer

@onready var health_bar = $HealthBar
@onready var hunger_bar = $HungerBar
@onready var thirst_bar = $ThirstBar

var max_health = 100
var max_hunger = 100
var max_thirst = 100

var health = max_health
var hunger = max_hunger
var thirst = max_thirst

# Velocidade de diminuição (por segundo)
var hunger_decrease_rate = 0.05   # a fome diminui devagar
var thirst_decrease_rate = 0.2   # a sede diminui mais rápido

func _process(delta):
	# Diminuir fome e sede gradualmente
	hunger = max(hunger - hunger_decrease_rate * delta, 0)
	thirst = max(thirst - thirst_decrease_rate * delta, 0)
	
	# Atualizar barras
	health_bar.value = health
	hunger_bar.value = hunger
	thirst_bar.value = thirst
