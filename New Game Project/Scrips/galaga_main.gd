extends Node2D

var numero=0
var respuestaCorrecta=" "
var respuestaPlayer=" "
var points=0
var lastentered=10
var cantidadchoques1=0
var cantidadchoques2=0
var cantidadchoques3=0
var cantidadchoques4=0
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
			$PreguntasGame/Pregunta.text = "Terminada la Edad Media, en el contexto de la política resulta que:\nA) La Iglesia resalta su poder. B) La Iglesia pierde el papel rector en la política. \nC) La Iglesia evangélica se posiciona en la política. D) La política desaparece."
			respuestaCorrecta = "La Iglesia pierde el papel rector en la política"





func _on_entered_1_area_entered(area):
	print("Entre a pregunta 1")
	lastentered=1
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
	lastentered=2
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
		print("El ultimo entered es: "+str(lastentered))
		$AudioExplocion.play()
		if lastentered==1:
			$PreguntasGame/Explosion1.show()
			$PreguntasGame/Explosion1.play("Explosion")
			await get_tree().create_timer(0.5).timeout
			$PreguntasGame/Explosion1.stop()
			$PreguntasGame/Explosion1.hide()
		elif lastentered==2:
			$PreguntasGame/Explosion2.show()
			$PreguntasGame/Explosion2.play("Explosion")
			await get_tree().create_timer(0.5).timeout
			$PreguntasGame/Explosion2.stop()
			$PreguntasGame/Explosion2.hide()
		elif lastentered==3:
			$PreguntasGame/Explosion3.show()
			$PreguntasGame/Explosion3.play("Explosion")
			await get_tree().create_timer(0.5).timeout
			$PreguntasGame/Explosion3.stop()
			$PreguntasGame/Explosion3.hide()
		elif lastentered==4:
			$PreguntasGame/Explosion4.show()
			$PreguntasGame/Explosion4.play("Explosion")
			await get_tree().create_timer(0.5).timeout
			$PreguntasGame/Explosion4.stop()
			$PreguntasGame/Explosion4.hide()
	else:
		print("¡Incorrecto!")
		points-=20
		if lastentered==1:
			cantidadchoques1+=1
			if cantidadchoques1==1:
				$PreguntasGame/Tiro1.play("ObjCon1Freezebie")
			elif cantidadchoques1==2:
				$PreguntasGame/Tiro1.play("ObjCon2Freezebie")
			elif cantidadchoques1==3:
				$PreguntasGame/Tiro1.play("ObjCon3Freezebie")
			elif cantidadchoques1==4:
				$PreguntasGame/Tiro1.play("ObjCon4Freezebie")
			elif cantidadchoques1==5:
				$PreguntasGame/Tiro1.play("TiroBlanco")
				cantidadchoques1==0
		elif lastentered==2:
			cantidadchoques2+=1
			if cantidadchoques2==1:
				$PreguntasGame/Tiro2.play("ObjCon1Freezebie")
			elif cantidadchoques2==2:
				$PreguntasGame/Tiro2.play("ObjCon2Freezebie")
			elif cantidadchoques2==3:
				$PreguntasGame/Tiro2.play("ObjCon3Freezebie")
			elif cantidadchoques2==4:
				$PreguntasGame/Tiro2.play("ObjCon4Freezebie")
			elif cantidadchoques2==5:
				$PreguntasGame/Tiro2.play("TiroBlanco")
				cantidadchoques2==0
		elif lastentered==3:
			cantidadchoques3+=1
			if cantidadchoques3==1:
				$PreguntasGame/Tiro3.play("ObjCon1Freezebie")
			elif cantidadchoques3==2:
				$PreguntasGame/Tiro3.play("ObjCon2Freezebie")
			elif cantidadchoques3==3:
				$PreguntasGame/Tiro3.play("ObjCon3Freezebie")
			elif cantidadchoques3==4:
				$PreguntasGame/Tiro3.play("ObjCon4Freezebie")
			elif cantidadchoques3==5:
				$PreguntasGame/Tiro3.play("TiroBlanco")
				cantidadchoques3==0
			
		elif lastentered==4:
			cantidadchoques4+=1
			if cantidadchoques4==1:
				$PreguntasGame/Tiro4.play("ObjCon1Freezebie")
			elif cantidadchoques4==2:
				$PreguntasGame/Tiro4.play("ObjCon2Freezebie")
			elif cantidadchoques4==3:
				$PreguntasGame/Tiro4.play("ObjCon3Freezebie")
			elif cantidadchoques4==4:
				$PreguntasGame/Tiro4.play("ObjCon4Freezebie")
			elif cantidadchoques4==5:
				$PreguntasGame/Tiro4.play("TiroBlanco")
				cantidadchoques4==0
			
		$AudioLosePoints.play()
	$PreguntasGame/LabelPoints.text= "Points: "+str(points)
	if points>=100:
		#get_tree().paused = true 
		$CharacterGalaga._Win()
		$PreguntasGame.hide()
		$FinalGame.show()
		$FinalGame/ganastespoints.text="Points: "+str(points)
	elif points<0:
		#get_tree().paused = true
		$CharacterGalaga._Lose()
		$PreguntasGame.hide()
		$FinalGame.show()
		$FinalGame/Label.text="Perdistes!"
		$FinalGame/ganastespoints.text="Points: "+str(points)
	if cantidadchoques1==0:
		$PreguntasGame/Tiro1.play("normal")


func _on_entered_3_area_entered(area):
	print("Entre a pregunta 3")
	lastentered=3
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
	lastentered=4
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


func _on_button_pressed():
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="Icezone"
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("Galaga")[0].queue_free()
