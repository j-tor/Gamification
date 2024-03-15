extends Node2D


#@onready var cursor = $cursor
@onready var seleccion_objetivo = Vector2()
var enemigo = ""

var damage = 1
var vida = 20
var Vida_maxima = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Idle")
	#$AnimationPlayer.play("parado")
	$ProgressBar.value = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if Main.ataque_jugador == true:
			_animacion_ataque()

func _damage():
	$AnimatedSprite2D.play("damage")
	await get_tree().create_timer(2).timeout
	$AnimatedSprite2D.play("Idle")

func _animacion_ataque():
	$AnimatedSprite2D.play("Atack")
	$AnimationPlayer.play("batalla")
	update_progressbar()
	#await get_tree().create_timer(2).timeout
	#$AnimatedSprite2D.play("Idle")
	#self.global_position.x = seleccion_objetivo.global_position.x + 200
	#self.global_position.y = seleccion_objetivo.global_position.y + 100
func update_progressbar():
		$ProgressBar.value = vida * 100/ Vida_maxima
		#$AnimatedSprite2D.play("Idle")
		if $ProgressBar.value <= 0:
				print("Barra llena")
				$"../Background_Music".stop()
				$"../DeathScreen".show()
				$"../You_Lose".play()

		





func _on_button_pressed():
	Input.action_press("ui_accept")
	


func _on_animation_player_animation_finished(anim_name):
	$"../r_b/Skull"._ready()
	$"../r_c/Skull"._ready()
	pass # Replace with function body.
