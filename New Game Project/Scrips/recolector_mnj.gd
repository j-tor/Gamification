extends Node


@onready var Player = $Player
var scoreJugador :=0
var RespuestaCorecta= " "
var RespuestaJugador= " "
var numero=10
var win=0
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
			$Questionario/Questionario.text = "Uno de los siguientes personajes fue el encargado de pintar la capilla Sixtina:
A) Miguel Ángel. B) Donatello. C) Leonardo Da Vinci. D) Francis Bacon"
			RespuestaCorecta= "Miguel Ángel"
		if numero==1:
			$Questionario/Questionario.text="Genio del renacimiento que esculpió el Moisés, el David y la Pietá:
A) Miguel Ángel Buonarroti. B) Leonardo Da Vinci. C) Rafael Sanzio. D) Galileo Galilei"
			RespuestaCorecta= "Miguel Ángel Buonarroti"
		if numero==2:
			$Questionario/Questionario.text = "Durante el renacimiento el estilo artístico que impregnó el arte, la filosofía, la pintura escritura fue el:
A) El Gótico. B) El barroco. C) el clasicismo. D) Romanticismo"
			RespuestaCorecta= "El barroco"
		if numero==3:
			$Questionario/Questionario.text = "Durante el renacimiento surge una nueva visión del hombre, que se vio reflejada en el arte, en la política
y en las ciencias sociales y humanas, a lo que se denomina:
A) Antropocentrismo. B) Humanismo. C) Paradigma antropológico. D) Teocentrismo."
			RespuestaCorecta= "Humanismo"
		if numero==4: 
			$Questionario/Questionario.text = "Cuatro genios del renacimiento (Leonardo, Donatello, Rafael y Michelangelo) han sido llevados a la
pantalla en los comics de:
A) Las tortugas ninjas. B) Los caballeros del Zodiaco. C) Los cuatro fantásticos. D) Los antagonistas de
Attack Titan"
			RespuestaCorecta= "Las tortugas ninjas"
		$Questionario.show()
		get_tree().paused = true 
		


func _on_player_score_up():
	scoreJugador+=3
	$ScoreLabel.text = str(scoreJugador)
	if scoreJugador>=100:
		print("Gano")
		get_tree().paused = true 
		$WinScreen.show()
		$Player.gano()
		$WinScreen/Label3.text = str(scoreJugador)


func _on_salir_button_2_pressed():
	get_tree().paused = false
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="element"
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("MiniRecolector")[0].queue_free()


func _on_respuesta_a_pressed():
	if numero==0:
		RespuestaJugador="Miguel Ángel"
	elif numero==1:
		RespuestaJugador="Miguel Ángel Buonarroti"
	elif numero==2:
		RespuestaJugador="El Gótico"
	elif numero==3:
		RespuestaJugador="Antropocentrismo"
	elif numero==4:
		RespuestaJugador="Las tortugas ninjas"
	_Validar_Estado()


func _on_respuesta_b_pressed():
	if numero==0:
		RespuestaJugador="Donatello"
	elif numero==1:
		RespuestaJugador="Leonardo Da Vinci"
	elif numero==2:
		RespuestaJugador="El barroco"
	elif numero==3:
		RespuestaJugador="Humanismo"
	elif numero==4:
		RespuestaJugador="Los caballeros del Zodiaco"
	_Validar_Estado()


func _on_respuesta_c_pressed():
	if numero==0:
		RespuestaJugador="Leonardo Da Vinci."
	elif numero==1:
		RespuestaJugador="Rafael Sanzio"
	elif numero==2:
		RespuestaJugador="el clasicismo"
	elif numero==3:
		RespuestaJugador="Paradigma antropológico"
	elif numero==4:
		RespuestaJugador="Los cuatro fantásticos."
	_Validar_Estado()


func _on_respuesta_d_pressed():
	if numero==0:
		RespuestaJugador="Francis Bacon"
	elif numero==1:
		RespuestaJugador="Galileo Galilei"
	elif numero==2:
		RespuestaJugador="Romanticismo"
	elif numero==3:
		RespuestaJugador="Teocentrismo"
	elif numero==4:
		RespuestaJugador="Los antagonistas de Attack Titan"
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
	if scoreJugador>=100:
		print("Gano")
		$WinScreen.show()
		get_tree().paused = true 
		$Player.gano()
		$WinScreen/Label3.text = str(scoreJugador)
		$Player.position = Vector2(1490,333)
		win= 1



func _on_regresar_pressed():
	get_tree().paused = false
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="element"
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("MiniRecolector")[0].queue_free()