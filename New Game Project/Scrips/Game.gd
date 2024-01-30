extends Node2D

@onready var GAME = $"."
@onready var animacion =  $ColorRect/AnimationPlayer

var siguiente_nivel
var mundo1 = preload("res://mundo.tscn").instantiate()
var casa = preload("res://Scene/castillo.tscn").instantiate()

func _ready():
	GAME.add_child(mundo1)

func _verficar_nivel():
	match siguiente_nivel:
		"castillo":
			siguiente_nivel = casa
	animacion.play("saliendo")

func _siguiente_nivel():
	var nivel = siguiente_nivel
	GAME.add_child(nivel)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "saliendo":
		$ColorRect/AnimationPlayer.play("entrando")
	if anim_name == "entrando":
		_siguiente_nivel()
