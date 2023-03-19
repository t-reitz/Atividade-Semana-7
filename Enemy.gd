extends RigidBody2D

# deleta o alien se ele passar da tela
func _process(delta):
	if not get_viewport_rect().has_point(global_position):
		queue_free()
