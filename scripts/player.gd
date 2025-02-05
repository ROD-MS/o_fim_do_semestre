extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var velX = 0
var velY = 0
var dirX = 0
var dirY = 0
var interacting = false

const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement(delta)
	animation()
	
	move_and_collide(Vector2(velX, velY))
	
func movement(delta):
	# Andar pra esquerda ou direita
	dirX = Input.get_axis("left", "right")
	
	# Andar pra cima e pra baixo
	dirY = Input.get_axis("up", "down")
	
	# Colocando a velocidade pro personagem andar
	velX = dirX * SPEED * delta
	velY = dirY * SPEED * delta
	
	# Para o movimento enquanto estiver falando com um personagem
	if interacting:
		velX = 0
		velY = 0
	
	
func animation():
	# Animação quando estiver parado
	if velX == 0 and velY == 0:
		animated_sprite.play("idle")
		
	# Animação andando pra esquerda
	if velX < 0 and velY == 0:
		animated_sprite.play("walk_left")
	
	# Animação andando pra direita
	if velX > 0 and velY == 0:
		animated_sprite.play("walk_right")
		
	# Animação andando pra cima
	if velY < 0 and velX == 0:
		animated_sprite.play("walk_up")
		
	# Animação andando pra baixo
	if velY > 0 and velX == 0:
		animated_sprite.play("walk_down")
	
		
		
	
	
	
