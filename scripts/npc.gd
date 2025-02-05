extends CharacterBody2D

@export var dialog: String
var canInteract = false
var player: CharacterBody2D
var canMove = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Interagindo com o personagem
	if Input.is_action_just_pressed("action") and canInteract:
		Dialogic.start(dialog)
		canInteract = false
		#player.interacting = true
			
#	# Liberando o movimento do player
#	if canMove == true:
#		player.interacting = false



func _on_interaction_area_body_entered(body):
	player = body
	if body.is_in_group("player"):
		canInteract = true
		print(canInteract)


func _on_interaction_area_body_exited(body):
	canInteract = false
	print(canInteract)
