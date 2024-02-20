extends Node2D

var numero=0
var respuestaCorrecta=" "
var respuestaPlayer=" "
var points=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	_CreatePregunta()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_collision_shape_2d_child_entered_tree(node):
	#no se de que es esto xd
	print("Entre a pregunta 1")
	
func _CreatePregunta():
	numero = randi() % 5
	print(numero)
	match numero:
		0:
			$PreguntasGame/Pregunta.text = "Durante el renacimiento, el modelo de gobierno es uno de los siguientes:\nA) Monarquía absoluta. B) Tiranía republicana. C) Democracia participativa. D) Liberalismo político."
			respuestaCorrecta = "Monarquía absoluta"
		1:
			$PreguntasGame/Pregunta.text = "De los siguientes acontecimientos, seleccione el que inicia el período moderno:\nA) Toma de Constantinopla. B) Tratado de paz de Westfalia. C) Toma de la Bastilla. D) La ruta de la seda."
			respuestaCorrecta = "Tratado de paz de westfalia"
		2:
			$PreguntasGame/Pregunta.text = "Durante el siglo XV, la sociedad se estratifica en tres estamentos definidos:\nA) Clase media, baja y alta. B) Nobleza, clero y estado llano. C) Artesanos, guardianes y gobernantes."
			respuestaCorrecta = "nobleza, clero y estado llano"
		3:
			$PreguntasGame/Pregunta.text = "Aparece el realismo político, que se basaba en un orden establecido, explicación de un sistema y recomendaciones de cómo gobernar:\nA) Tomás Moro. B) Jean Bodín. C) Nicolás Maquiavelo. D) Erasmo de Rotterdam."
			respuestaCorrecta = "Nicolas Maquiavelo"
		4:
			$PreguntasGame/Pregunta.text = "Terminada la Edad Media, en el contexto de la política resulta que:\nA) La Iglesia resalta su poder. B) La Iglesia pierde el papel rector en la política. C) La Iglesia evangélica se posiciona en la política. D) La política desaparece."
			respuestaCorrecta = "La Iglesia pierde el papel rector en la política"





func _on_entered_1_area_entered(area):
	print("Entre a pregunta 1")
	if numero==0:
		respuestaPlayer="Monarquía absoluta"
	elif numero==1:
		respuestaPlayer="Toma de Constantinopla"
	elif numero==2:
		respuestaPlayer="Clase media, baja y alta"
	elif numero==3:
		respuestaPlayer="Tomás Moro"
	elif numero==4:
		respuestaPlayer="La Iglesia resalta su poder"
	_validacion()


func _on_entered_2_area_entered(area):
	print("Entre a pregunta 2")
	if numero==0:
		respuestaPlayer="Tiranía republicana"
	elif numero==1:
		respuestaPlayer="Tratado de paz de westfalia"
	elif numero==2:
		respuestaPlayer="nobleza, clero y estado llano"
	elif numero==3:
		respuestaPlayer="Jean Bodín"
	elif numero==4:
		respuestaPlayer="La Iglesia pierde el papel rector en la política"
	_validacion()


func _validacion():
	print("Correcta: " + respuestaCorrecta)
	print("Seleccionado: " + respuestaPlayer)
	if respuestaPlayer == respuestaCorrecta:    
		print("¡Correcto!")
		_CreatePregunta()
		points+=20
		
	else:
		print("¡Incorrecto!")
		points-=20
		
	$PreguntasGame/LabelPoints.text= "Points: "+str(points)
	if points>=100:
		get_tree().paused = true 
		$PreguntasGame.hide()
		$FinalGame.show()
		$FinalGame/ganastespoints.text="Points: "+str(points)
	elif points<0:
		get_tree().paused = true 
		$PreguntasGame.hide()
		$FinalGame.show()
		$FinalGame/Label.text="Perdistes!"
		$FinalGame/ganastespoints.text="Points: "+str(points)


func _on_entered_3_area_entered(area):
	print("Entre a pregunta 3")
	if numero==0:
		respuestaPlayer="Democracia participativa"
	elif numero==1:
		respuestaPlayer="Toma de la Bastilla"
	elif numero==2:
		respuestaPlayer="Artesanos, guardianes y gobernantes"
	elif numero==3:
		respuestaPlayer="Nicolas Maquiavelo"
	elif numero==4:
		respuestaPlayer="La Iglesia evangélica
se posiciona en la política"
	_validacion()


func _on_entered_4_area_entered(area):
	print("Entre a pregunta 4")
	if numero==0:
		respuestaPlayer="Liberalismo político"
	elif numero==1:
		respuestaPlayer="La ruta de la seda."
	elif numero==2:
		respuestaPlayer="No existe"
	elif numero==3:
		respuestaPlayer="Erasmo de Rotterdam"
	elif numero==4:
		respuestaPlayer="La política desaparece."
	_validacion()
