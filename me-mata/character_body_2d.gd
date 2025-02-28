extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var pos:Vector2
var dir: Vector2 = Vector2(0,0)

func _ready() -> void:
	pos = get_global_mouse_position()
	
func _physics_process(delta: float) -> void:
	
	velocity.x = (dir*SPEED)[0]
	velocity.y = (dir*SPEED)[1]
	move_and_slide()

func set_dir(direction:Vector2):
	dir = direction
