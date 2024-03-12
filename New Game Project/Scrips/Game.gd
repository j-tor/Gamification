extends Node2D

@onready var GAME = $"."
@onready var animacion =  $AnimationPlayer
var ubicacion #= Vector2(172,1533)

var siguiente_nivel
var nuevo_nivel

var mundo1 = preload("res://mundo.tscn")
var casa = preload("res://Scene/castillo.tscn")
var Royal = preload("res://Scene/Royal Valley.tscn")
var Element = preload("res://Scene/Element Santuary.tscn")
var ruleta = preload("res://Scene/RuletaPrincipal.tscn")
var Icezone = preload("res://Scene/Ice zone.tscn")
var MiniJuegoRecolector = preload("res://Scene/recolector_mnj.tscn")
var MiniGameCastillo = preload("res://Scene/Royal_Valley-Minigame.tscn")
var login = preload("res://LOGIN.tscn")
var GalagaGame = preload("res://Scene/galaga_main.tscn")
var EleccionGame = preload("res://Scene/juego_1.tscn")
var EleccionBando = preload("res://Scene/Witchcave.tscn") 
var WarRunGame = preload("res://Scene/boos_room.tscn")
var Universidad = preload("res://Univerisdad.tscn")
var VideoIntro = preload("res://Scene/nodo_base_video_introduccion.tscn")
var CreateaUser = preload("res://CREATEUSER.tscn")
func _ready():
	#var nivel = mundo1.instantiate()
	var nivel = login.instantiate()
	add_child(nivel)

func _verficar_nivel():
	match siguiente_nivel:
		"castillo":
			nuevo_nivel = casa
		"mundo1":
			nuevo_nivel= mundo1
		"royal":
			nuevo_nivel = Royal
		"element":
			nuevo_nivel= Element
		"Ruleta":
			nuevo_nivel= ruleta
		"Icezone":
			nuevo_nivel = Icezone
		"MiniRecolector":
			nuevo_nivel = MiniJuegoRecolector
		"MiniGameCastillo":
			nuevo_nivel = MiniGameCastillo
		"Login":
			nuevo_nivel=login
		"Galaga":
			nuevo_nivel=GalagaGame
		"EleccionGame":
			nuevo_nivel= EleccionGame
		"VideoIntroduccion":
			nuevo_nivel=VideoIntro
		"crearUsuario":
			nuevo_nivel= CreateaUser
		"EleccionBando":
			nuevo_nivel = EleccionBando
		"WarGame":
			nuevo_nivel= WarRunGame
		"Universidad":
			nuevo_nivel = Universidad
	animacion.play("saliendo")

func _siguiente_nivel():
	var level = nuevo_nivel.instantiate()
	get_tree().get_nodes_in_group("GAME")[0].call_deferred("add_child",level)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "saliendo":
		$AnimationPlayer.play("entrando")
	if anim_name == "entrando": 
		_siguiente_nivel()
