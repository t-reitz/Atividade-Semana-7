extends RigidBody2D
	
var velocity = Vector2()

# checa se alguma bala atinge os aliens e deleta a instancia da classe do jogo
func _on_Area2D_body_entered(body):
	if body.name == "Enemy":
		body.queue_free()
		self.queue_free()
		Global.enemies_killed = Global.enemies_killed + 1

