extends Node2D

var enemy_spawn_interval = 3 # Tempo entre spawn dos inimigos
var enemy_fall_speed = 100.0 # Velocidade dos inimigos

var enemy_scene = preload("res://Enemy.tscn") # load na cena dos inimigos
var last_enemy_spawn_time = 0 # variavel que armazena o tempo em que o ultimo inimigo foi spawnado

func _process(delta):
	# atualiza os labels na tela
	$ColorRect/tiros.text = str(Global.shots_fired)
	$ColorRect/kills.text = str(Global.enemies_killed)
	
	# torna o jogo mais dificil dependendo do numero de inimigos matados
	if Global.enemies_killed == 5:
		enemy_fall_speed = 115
	elif Global.enemies_killed == 10:
		enemy_fall_speed = 130
	elif Global.enemies_killed == 15:
		enemy_fall_speed = 300
	
	# responsavel por spawnar os inimigos com um delay
	if (OS.get_ticks_msec() / 1000.0) - last_enemy_spawn_time > enemy_spawn_interval:
		spawn_enemy()
		last_enemy_spawn_time = OS.get_ticks_msec() / 1000.0
	
# funcao que spawna inimigos no topo da tela
func spawn_enemy():
	var enemy = enemy_scene.instance()
	add_child(enemy)
	var x = rand_range(0, 1000) # Spawna os inimigos em uma coordenada de x aleatoria entre 0  e 1000
	enemy.position = Vector2(x, 0) 
	enemy.set_linear_velocity(Vector2(0, enemy_fall_speed))
