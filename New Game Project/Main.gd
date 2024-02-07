extends Node

var ataque_jugador = false
var objetivo_enemigo = 1
var objetivo_player  = 1
var banco
var juego
#dialogos
var GreeGame=false
var pinkGame=false

var nombre_objeto

var dialogo_objeto = []
var rulet=false

# Called when the node enters the scene tree for the first time.

func _game():
	randomize()
	_dialogo()
	

func _dialogo():

	juego = randi() % 4
	if juego == 0:
		banco = "CIENCIA"
	if juego == 1:
		banco = "ARTE"
	if juego == 2:
		banco = "DERECHO"
	if juego == 3:
		banco = "POLITICA"	
	
	print(banco)	
	match nombre_objeto:
		"Entradas":
			dialogo_objeto = [
				"Esta cerrado. . . . . . . . . .",#0
				"Tinnes que cumplir con la mision de la ruleta antes",#1
				"Regresa despues. . . . . . ."#2
			]
		"Entrada a ruleta":
			dialogo_objeto = [
				"Zona de "+banco,#0
				#"color azul",#1
				#"Regresa despues. . . . . . ."#2
			]
			rulet=false
