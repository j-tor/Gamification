extends Node


#batallas
var ataque_jugador = false
var objetivo_enemigo = 1
var objetivo_player  = 1

#dialogos

var nombre_objeto

var dialogo_objeto = []


func _dialogo():
	match nombre_objeto:
		"letrero":
			dialogo_objeto = [
				"Esta cerrado. . . . . . . . . .",#0
				"Talvez tengo  que cumplir una mision antes",#1
				"Regresare despues"#2
			]

