extends KinematicBody2D

var speed = 400
var bullet_scene: PackedScene
var last_bullet_time = 0
var bullet_cooldown_time = 0.5

func _ready():
	# load na cena do tiro
	bullet_scene = load("res://Bullet.tscn")

func _physics_process(_delta):
	var motion = Vector2()

	# mapeando controles
	if Input.is_action_pressed("move_up"):
		motion.y -= 1
	if Input.is_action_pressed("move_down"):
		motion.y += 1
	if Input.is_action_pressed("move_left"):
		motion.x -= 1
	if Input.is_action_pressed("move_right"):
		motion.x += 1

	motion = motion.normalized() * speed
	move_and_slide(motion)
	
	# controla a acao de atirar do player com um delay de 0.5 segundos entre tiros
	if Input.is_action_pressed("shoot") and (OS.get_ticks_msec() / 1000.0) - last_bullet_time > bullet_cooldown_time:
		shoot()
		last_bullet_time = OS.get_ticks_msec() / 1000.0

# funcao responsavel por fazer o player atirar
func shoot():
	var bullet = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.position = position
	bullet.linear_velocity = Vector2(0, -500)
	
	Global.shots_fired = Global.shots_fired + 1
	
# detecta se algum inimigo atingiu o player e da game over	
func _on_Area2D_body_entered(body):
	if body.name == "Enemy":
		get_tree().change_scene("res://EndScene.tscn")
