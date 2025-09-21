extends CanvasLayer

@onready var health_bar = $HealthBar
@onready var hunger_bar = $HungerBar
@onready var thirst_bar = $ThirstBar
@onready var compass = $Compass  # bússola

# Referências aos nós já instanciados na cena
var player
var destination

var max_health = 100
var max_hunger = 100
var max_thirst = 100

var health = max_health
var hunger = max_hunger
var thirst = max_thirst

# Velocidade de diminuição (por segundo)
var hunger_decrease_rate = 0.05   # a fome diminui devagar
var thirst_decrease_rate = 0.2    # a sede diminui mais rápido
var health_decrease_rate = 0.9    # vida diminui quando fome ou sede = 0

func _ready():
	# Referenciar nós instanciados corretamente
	player = get_node("/root/Main/Ship")
	destination = get_node("/root/Main/Continentes/Americas/Marker2D")

func _process(delta):
	# Diminuir fome e sede gradualmente
	hunger = max(hunger - hunger_decrease_rate * delta, 0)
	thirst = max(thirst - thirst_decrease_rate * delta, 0)
	
	# Se qualquer uma estiver em 0, diminuir vida
	if hunger <= 0 or thirst <= 0:
		health = max(health - health_decrease_rate * delta, 0)
	
	# Atualizar barras
	health_bar.value = health
	hunger_bar.value = hunger
	thirst_bar.value = thirst
	
	# --- Atualizar bússola ---
	if player and destination:  # garantir que os nós existem
		var dir = (destination.global_position - player.global_position).normalized()
		compass.rotation = dir.angle() - deg_to_rad(-90) 
