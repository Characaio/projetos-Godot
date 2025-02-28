extends Area2D

var direction: Vector2
const SPEED = 5

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	queue_free()
func _physics_process(delta: float) -> void:
	global_position+= direction * SPEED


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
