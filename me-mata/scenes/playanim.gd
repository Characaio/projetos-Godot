extends CharacterBody2D



func _physics_process(delta: float) -> void:
	
	look_at(get_global_mouse_position())
	rotate(PI*2.5)
	#o angle_to_point usa radians, radians é relaciona a pi, por isso o -3,14, ele é multiplicado por 2,5 para acertar a direção
	#rotation = -PI*2.5 + get_global_mouse_position().angle_to_point(position)
	
