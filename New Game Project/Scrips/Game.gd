extends Node2D

@onready var GAME = $"."
@onready var animacion =  $AnimationPlayer
var ubicacion = Vector2(86,-925)

var siguiente_nivel
var nuevo_nivel

var mundo1 = preload("res://mundo.tscn")
var casa = preload("res://Scene/castillo.tscn")
var Royal = preload("res://Scene/Royal Valley.tscn")
var Element = preload("res://Scene/Element Santuary.tscn")
var ruleta = preload("res://RuletaPrincipal.tscn")
var Icezone = preload("res://Scene/Ice zone.tscn")

func _ready():
	var nivel = mundo1.instantiate()
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
		"IceZone":
			nuevo_nivel= Icezone
	animacion.play("saliendo")

func _siguiente_nivel():
	var level = nuevo_nivel.instantiate()
	get_tree().get_nodes_in_group("GAME")[0].call_deferred("add_child",level)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "saliendo":
		$AnimationPlayer.play("entrando")
	if anim_name == "entrando": 
		_siguiente_nivel()
