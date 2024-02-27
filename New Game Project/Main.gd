extends Node

var ataque_jugador = false
var objetivo_enemigo = 1
var objetivo_player  = 1
var banco
var juego
var bando=""
var bruja=false
#dialogos
var color 
var GreeGame=false
var pinkGame=false
var BlueGame=false
var yellowGame=false
var Vida_base=0



var nombre_objeto

var dialogo_objeto = []
var rulet=false
var seleccionado

# Called when the node enters the scene tree for the first time.

func _game():
	randomize()
	_dialogo()
	
	
	

func _dialogo():
	if bando == "Racionalista" || bando == "Empirista":

		seleccionado = true
	else:
		color =false
	
	print(banco)	
	match nombre_objeto:
		"Entradas":
			dialogo_objeto = [
				"Esta cerrado. . . . . . . . . .",#0
				"Tienes que cumplir con la mision de la ruleta antes",#1
				"Regresa despues. . . . . . ."#2
			]
		"Entrada a ruleta":
			dialogo_objeto = [
				"Bienvenido a la Ruleta del saber ",#0
				"para girar presione F ",#1
				"Regresar preciona E. . . . . . ."#2
			]
			rulet=false
		"Empirista":
			if bando=="Empirista":
				dialogo_objeto = [
					"Has elejido el camino Empirista. . . . . . . . . .",#0
					"Dirigete al castillo para el combate por el conocimiento",#1
					]
				
			elif bando=="":
				dialogo_objeto = [
					"Sopa del conocimiento Empirista. . . . . . ",#0
					"Habla con la buja para poder tomarla. . . .",#1
					]
			if seleccionado == true && color==true :
				dialogo_objeto = [
						"Ya elejiste el bando. . . . . . ",#0
						]
		"Racionalista":
			if bando=="Racionalista":
				dialogo_objeto = [
					"Has elejido el camino Racionalista. . . . . . . . . .",#0
					"Dirigete al castillo para el combate por el conocimiento",#1
					]

			elif bando=="":
				dialogo_objeto = [
					"Sopa del conocimiento Racionalista. . . . . . ",#0
					"Habla con la buja para poder tomarla. . . .",#1
					]
				
			if seleccionado == true && color==true :
				dialogo_objeto = [
						"Ya elejiste el bando. . . . . . ",#0
						]
						
		"Bruja":
			dialogo_objeto = [
					"He preparado dos caldos con el conocimiento Epistemefigther.",#0
					"Estos caldos te van ayudar en tu siguiente combate.",#1
					"El caldo azul de brindara todo el conocimiento Racionalizta",#2
					"El caldo Rojo de brindara todo el conocimiento Empirista",#3
					"Elije sabiamente cual tomar.....",#4
					]
