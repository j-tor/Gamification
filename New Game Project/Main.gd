extends Node

var ataque_jugador = false
var objetivo_enemigo = 1
var objetivo_player  = 1

#dialogos

var nombre_objeto

var dialogo_objeto = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _dialogo():
	match nombre_objeto:
		"letrero":
			dialogo_objeto = [
				"Esta cerrado. . . . . . . . . .",#0
				"Tinnes que cumplir con la mision de la ruleta antes",#1
				"Regresare despues"#2
			]
