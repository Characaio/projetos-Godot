extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction:int

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("baixo"):
		velocity.y += SPEED 
	
		
	elif Input.is_action_just_pressed("cima"):
		velocity.y -= SPEED 
	
		
	elif Input.is_action_just_pressed("esquerda"):
		velocity.x -= SPEED 
	
		
	elif Input.is_action_just_pressed("direita"):
		velocity.x += SPEED 
	
	else:
		velocity.y = move_toward(velocity.y, 0, 10)
		velocity.x = move_toward(velocity.x, 0, 10)
	
	move_and_slide()
