extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var state:String
@onready var staffanim: AnimatedSprite2D = $staffanim
var attacking:bool



func _physics_process(delta: float) -> void:
	if !attacking:
		staffanim.play("idle")
	look_at(get_global_mouse_position())
	rotate(PI*2.5)
	move_and_slide()




func _on_player_attacked() -> void:
	#print('AAAAAA')
	attacking = true
	staffanim.play("attack")
	


func _on_staffanim_animation_finished() -> void:
	if attacking:
		attacking = false
