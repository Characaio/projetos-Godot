extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var playanim: AnimatedSprite2D = $playanim
@onready var staffanim: AnimatedSprite2D = $staff/staffanim
@onready var tpcool: Timer = $tpcool
@onready var tpcool_2: Timer = $tpcool2

@onready var staffend: Marker2D = $staff/staffend



@onready var staff: CharacterBody2D = $staff

var magia = preload("res://scenes/magia.tscn")
var fade = preload("res://scenes/fadeout.tscn")
var state:String = 'idle'
var attackcool:bool = true
var mpos: Vector2
var who:int = 0
var tped:bool
var horizontal:int
var vertical:int
var magcool:bool = false
var magictime:int = 1
signal attacked



func _physics_process(delta: float) -> void:
	#print(state)
	#look_at(get_global_mouse_position())
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#print('hello')
		emit_signal("attacked")
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) and !magcool:
		var magiains = magia.instantiate()
		get_parent().add_child(magiains)
		magiains.global_position = staffend.global_position
		magiains.direction = (get_global_mouse_position()- global_position).normalized()
		magcool = true
		
		await get_tree().create_timer(magictime).timeout
		magcool = false
		
		
	if Input.is_action_just_pressed('e'):
		state = 'telport'
		teleported()
		
	mpos = get_global_mouse_position()
	
	if mpos.x > position.x:
		playanim.flip_h = false
	if mpos.x < position.x:
		playanim.flip_h = true
	
	if state != 'teleport':
		horizontal = Input.get_axis("esquerda", "direita")
		vertical = Input.get_axis("cima", "baixo")
		if horizontal or vertical:
			state = 'walk'
			playanim.play('walk')
		elif not horizontal and not vertical:
			state = 'idle'
			playanim.play('idle')
			velocity.y = move_toward(velocity.y, 0, SPEED)
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	if state == 'walk':
		if state != 'teleport':
			if horizontal:
				velocity.x = horizontal * SPEED
				
			if vertical:
				velocity.y = vertical * SPEED
		
			
			
			
	
	move_and_slide()




func teleported() -> void:
	#print("im tping")
	horizontal = 0
	vertical = 0
	
	if not tped:
		state = 'teleport'
		playanim.play("teleport 1")
		tpcool.start()
		tped = true
		
		
		
	

func _on_tpcool_timeout() -> void:
	var fadeins = fade.instantiate()
	fadeins.visible = true
	fadeins.position = position
	get_parent().add_child(fadeins)
	position = get_global_mouse_position()
	playanim.play("teleport 2")
	

func _on_playanim_animation_finished() -> void:
	if tped == true:
		state = 'walk'
		
		tped = false
