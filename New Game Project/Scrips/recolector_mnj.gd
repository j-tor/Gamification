extends Node


@onready var Player = $Player
var scoreJugador :=0
var RespuestaCorecta= " "
var RespuestaJugador= " "
var numero=10
func _ready():
	$JuegoSonido.play()
	Player.connect("scoreUp",subirScore)
	Player.connect("playedDied",morir)

func subirScore():
	scoreJugador+=1
	$ScoreLabel.text = str(scoreJugador)

func morir():
	if scoreJugador<0:
		$DeathScreen/HBoxContainer/FinalScore.text = str(scoreJugador)
		$DeathScreen.show()
		get_tree().paused = true 

func _on_player_played_died():
	
	if scoreJugador<0:
		$DeathScreen/HBoxContainer/FinalScore.text = str(scoreJugador)
		$DeathScreen.show()
		get_tree().paused = true 
	else:
		numero =randi() %5
		print(numero)
		if numero==0:
			$Questionario/Questionario.text = "2.⁠ ⁠El renacimiento supone una época de absolutismo y nacionalismos, como el nacimiento de fuertes
			monarquías europeas centralizadas como:
			A) Grecia. B) Inglaterra. C) Yugoslavia. D) Egipto"
			RespuestaCorecta= "Inglaterra"
		if numero==1:
			$Questionario/Questionario.text="Resurge el interés por Grecia y Roma, junto al declive del sistema feudal, el crecimiento del comercio e
			innovaciones entre las que mencionamos:
			A) La imprenta y la brújula. B) La rueda y la escritura C) Las máquinas de vapor y la producción en masa. D) La pólvora y La rueda"
			RespuestaCorecta= "La imprenta y la brújula"
		if numero==2:
			$Questionario/Questionario.text = "La toma de Constantinopla supone un bloqueo comercial entre Europa y Asia (la ruta de la seda) y ocurrió
			en lo que hoy es actualmente:
			A) Eslovaquia. B) Estambul en Turquía. C) Mesopotamia. D) Jerusalén"
			RespuestaCorecta= "Estambul en Turquía"
		if numero==3:
			$Questionario/Questionario.text = "Antes de la consolidación del estado moderno, Italia estuvo divida en pequeñas ciudades-estado
			normalmente enfrentadas entre si, como es el caso de:
			A) Florencia-Napoli. B) Ámsterdam-Cracovia. C) Reims-Colonia. D) Milán-Lourdes."
			RespuestaCorecta= "Florencia-Napoli"
		if numero==4: 
			$Questionario/Questionario.text = "Después del feudalismo medieval acudimos al surgimiento de una nueva clase social conocida como la:
			A) La monarquía. B) El mercantilismo. C) La burguesía. D) El proletariado"
			RespuestaCorecta= "La burguesía"
		$Questionario.show()
		get_tree().paused = true 
		


func _on_player_score_up():
	scoreJugador+=3
	$ScoreLabel.text = str(scoreJugador)


func _on_salir_button_2_pressed():
	get_tree().quit()
	#get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "royal"
	#get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	#get_tree().get_nodes_in_group("MiniRecolector")[0].queue_free()


func _on_respuesta_a_pressed():
	if numero==0:
		RespuestaJugador="Grecia"
	elif numero==1:
		RespuestaJugador="La imprenta y la brújula"
	elif numero==2:
		RespuestaJugador="Eslovaquia"
	elif numero==3:
		RespuestaJugador=" Florencia-Napoli"
	elif numero==4:
		RespuestaJugador="La monarquía"
	_Validar_Estado()


func _on_respuesta_b_pressed():
	if numero==0:
		RespuestaJugador="Inglaterra"
	elif numero==1:
		RespuestaJugador="La rueda y la escritura"
	elif numero==2:
		RespuestaJugador="Estambul en Turquía"
	elif numero==3:
		RespuestaJugador="Ámsterdam-Cracovia"
	elif numero==4:
		RespuestaJugador="El mercantilismo"
	_Validar_Estado()


func _on_respuesta_c_pressed():
	if numero==0:
		RespuestaJugador="Yugoslavia"
	elif numero==1:
		RespuestaJugador="Las máquinas de vapor y la producción en masa"
	elif numero==2:
		RespuestaJugador="Mesopotamia"
	elif numero==3:
		RespuestaJugador="Reims-Colonia"
	elif numero==4:
		RespuestaJugador="La burguesía"
	_Validar_Estado()


func _on_respuesta_d_pressed():
	if numero==0:
		RespuestaJugador="Egipto"
	elif numero==1:
		RespuestaJugador="La pólvora y La rueda"
	elif numero==2:
		RespuestaJugador="Jerusalén"
	elif numero==3:
		RespuestaJugador="Milán-Lourdes"
	elif numero==4:
		RespuestaJugador="El proletariado"
	_Validar_Estado()


func _Validar_Estado():
	print(RespuestaJugador)
	print(RespuestaCorecta)
	if(RespuestaJugador==RespuestaCorecta):
		print("entro a respuesta correcta")
		scoreJugador+=15
		
	else:
		print("entro a incorrecta")
		scoreJugador-=20
	$Questionario.hide()
	$ScoreLabel.text = str(scoreJugador)
	get_tree().paused = false 
	if scoreJugador<0:
		$Player.morirse()
