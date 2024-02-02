extends Sprite2D


@onready var cursor = $cursor
@onready var seleccion_objetivo = Vector2()
var enemigo = ""

var damage = 1
var vida = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer.play("parado")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if Main.ataque_jugador == true:
			_seleccionar_objetivo()
			_animacion_ataque()


func _animacion_ataque():
	$AnimationPlayer.play("ataque_1")
	self.global_position.x = seleccion_objetivo.global_position.x + 200
	self.global_position.y = seleccion_objetivo.global_position.y + 100
func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"ataque_1":
			get_tree().get_nodes_in_group(str(enemigo))[0].damage_recibido = damage
			get_tree().get_nodes_in_group(str(enemigo))[0].vida -= damage
			get_tree().get_nodes_in_group(str(enemigo))[0]._damage()
			$".".global_position = Vector2(955,307)
			$AnimationPlayer.play("parado")
			Main.ataque_jugador = false

func _seleccionar_objetivo():
	match Main.objetivo_enemigo:
		1:
			seleccion_objetivo = $"../../../enemigos/enemi001"
			enemigo = "enemi001"
		2:
			seleccion_objetivo = $"../../../enemigos/enemi002"
			enemigo = "enemi002"
		3:
			seleccion_objetivo = $"../../../enemigos/enemi003"
			enemigo = "enemi003"


func _on_area_2d_mouse_entered():
	cursor.visible = true
	$Control.visible = true

func _on_area_2d_mouse_exited():
	cursor.visible = false
	$Control.visible = false

func _on_control_mouse_entered():
	pass # Replace with function body.


func _on_button_pressed():
	Input.action_press("tecla_f")
	
