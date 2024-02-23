extends Node2D

#Animacion del link que hace las preguntas
@onready var animationsEnemy = $Enemy/AnimatedSprite2D
#Burbujita de texto (solo la imagen)
@onready var bubbledialog = $Sprite2D
#Texto dentro de la burbujita
@onready var bubbleText = $Sprite2D/RichTextLabel

@onready var player1 = $playerlink
@onready var player2 = $playerlink2


@onready var PanelPre = $Panel

var Matriz = [[0,0,0],[0,0,0],[0,0,0]]
var ActualPlayer = 0
@onready var MatrizGraficaEquis = [[$equis, $equis2, $equis3], [$equis4, $equis5, $equis6],
[$equis7, $equis8, $equis9]]

@onready var MatrizGraficaCero = [[$cero, $cero2, $cero3],[$cero4, $cero5, $cero6],[$cero7, $cero8, $cero9]]

var TurnoX0 = false
var SeMueve = false
var SePregunta = false
var SeCuenta = false

#Options, son los 4 textos donde cada uno tiene 1 opcion de las respuestas de una pregunta
@onready var Option_1 = $Option1
@onready var Option_2 = $Option2
@onready var Option_3 = $Option3
@onready var Option_4 = $Option4


#El player, lo llamo para saber si esta sobre una respuesta
@onready var Player = $playerlink



@onready var equis = $equis

# El corazon 1 y 2, el 3ro no lo necesito porque cuando solo queda ese y se falla de un solo
# perdemos
@onready var Heart2 = $Heart2
@onready var Heart3 = $Heart3
@onready var Heart5 = $Heart5
@onready var Heart6 = $Heart6

var AnswerColor = "" #Color de respuesta, puede ser r g b o p
var actualMoment = 0  # el momento actual, determina si estamos en el inicio, una pregunta, cuando se dice si es correcta o no
var ResponseColor = "" #Es el color en donde colocamos el personaje y lo comparamos con la respuesta real
var hearts = 3 # el numero de corazones que tenemos al inicio
var hearts2 = 3
var regresarInicio=false

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		print(event.position)
		if SePregunta:
			if (136 <=event.position.x  and event.position.x <= 585) and (121 <= event.position.y and event.position.y <= 266):
				ResponseColor="r"
				actualMoment+=1
				changeMoment(actualMoment)
			elif (593 <=event.position.x  and event.position.x <= 1056) and (121 <= event.position.y and event.position.y <= 266):
				ResponseColor="b"
				actualMoment+=1
				changeMoment(actualMoment)
			
			elif (136 <=event.position.x  and event.position.x <= 585) and (281 <= event.position.y and event.position.y <= 421):
				ResponseColor="g"
				actualMoment+=1
				changeMoment(actualMoment)
			elif (593 <=event.position.x  and event.position.x <= 1056) and (281 <= event.position.y and event.position.y <= 421):
				ResponseColor="p"
				actualMoment+=1
				changeMoment(actualMoment)
		#elif (283 <=event.position.x  and event.position.x <= 385) and (158 <= event.position.y and event.position.y <= 265):
			#print("Clic en el espacio 5")
			#Matriz[1][1]=ActualPlayer
		#elif (385 <=event.position.x  and event.position.x <= 502) and (158 <= event.position.y and event.position.y <= 265):
			#print("Clic en el espacio 6")
			#Matriz[1][2]=ActualPlayer
		#elif (163 <=event.position.x  and event.position.x <= 283) and (265 <= event.position.y and event.position.y <= 360):
			## Espacio 1
			#Matriz[2][0]=ActualPlayer
			#print("Clic en el espacio 7")
		#elif (283 <=event.position.x  and event.position.x <= 385) and (265 <= event.position.y and event.position.y <= 360):
			#print("Clic en el espacio 8")
			#Matriz[2][1]=ActualPlayer
		#elif (385 <=event.position.x  and event.position.x <= 502) and (265 <= event.position.y and event.position.y <= 360):
			#print("Clic en el espacio 9")
			#Matriz[2][2]=ActualPlayer
	
func _ready():
	#Todo esto se ejecuta al inicio, reiniciamos el tiempo
	#establecemos el primer momento (que es Inicio {0})
	# iniciamos la animacion del link que habla y decimos que aun no se muestra el cheque
	# o la x
	Time_Reset()
	changeMoment(actualMoment)
	animationsEnemy.play()
	
	equis.hide()
	pass # Replace with function body.


#establezco las variables del tiempo
var seconds=0
var minutes=0
var Dseconds=10
var Dminutes=0


func _process(delta):
	pass


#esta funcion se ejecuta cada segundo, es para determinar el tiempo que ha pasado
#y cada 10 segundos verifica si se quedo sin vidas y si no 
#entonces se hace un cambio de momento pasamos de 
# Inicio a Pregunta y de Pregunta a Respuesta y luego devuelta a Pregunta
func _on_timer_timeout():


	if(!SeMueve):
		player1.position.x = 110
		player1.position.y = 56
		player2.position.x = 110
		player2.position.y = 6


	var ganador = verificar_ganador()
	
	if ganador == 1:
		print("¡El jugador X ha ganado!")
	elif ganador == 2:
		print("¡El jugador O ha ganado!")
	else:
		print("No hay un ganador todavía.")
	
	
	if(SeCuenta):
		bubbleText.text = str(seconds)
	
	
	
	if seconds == 0:
		if minutes > 0: 
			minutes -=1 
			seconds=60
			
	if seconds > 0:
		seconds-=1
	else: 
	
		if !(SeMueve or SePregunta):
			actualMoment+=1
		
		if !regresarInicio: 
			if hearts == 0 or  hearts2 == 0: 
				actualMoment=-1
				regresarInicio=true
		else: 
			actualMoment=-2
		
		
			
		changeMoment(actualMoment)
		HeartsChanger()
		HeartsChanger2()
		if(!SeCuenta):
			
			Time_Reset()
		else:
			
			seconds=3
		

	
	pass 


#esta funcion determina cuantos corazones hay que mostrar
func HeartsChanger():
	if hearts == 2:
		Heart3.hide()
	elif hearts == 1:
		Heart2.hide()
		
#esta funcion determina cuantos corazones hay que mostrar
func HeartsChanger2():
	if hearts2 == 2:
		Heart6.hide()
	elif hearts2 == 1:
		Heart5.hide()

#Reinicia el tiempo despues de 10 segundos
func Time_Reset():
	seconds=Dseconds
	minutes=Dminutes

#Oculta la X y el Cheque despues de ya mostrarlos
#func ResetChecker():
func matrizView_updater():
	for i in range(len(Matriz)):
		for j in range(len(Matriz[0])):
			if(Matriz[i][j]==2): 
				MatrizGraficaEquis[i][j].show()
			if(Matriz[i][j]==1): 
				MatrizGraficaCero[i][j].show()
			

func verificar_ganador():
	# Verificar filas
	for fila in Matriz:
		if fila.count(1) == 3:  # Si todas las celdas son 1 (jugador X)
			return 1
		elif fila.count(2) == 3:  # Si todas las celdas son 2 (jugador O)
			return 2

	# Verificar columnas
	for j in range(3):
		if Matriz[0][j] == 1 and Matriz[1][j] == 1 and Matriz[2][j] == 1:
			return 1
		elif Matriz[0][j] == 2 and Matriz[1][j] == 2 and Matriz[2][j] == 2:
			return 2

	# Verificar diagonales
	if Matriz[0][0] == 1 and Matriz[1][1] == 1 and Matriz[2][2] == 1:
		return 1
	elif Matriz[0][0] == 2 and Matriz[1][1] == 2 and Matriz[2][2] == 2:
		return 2
	elif Matriz[0][2] == 1 and Matriz[1][1] == 1 and Matriz[2][0] == 1:
		return 1
	elif Matriz[0][2] == 2 and Matriz[1][1] == 2 and Matriz[2][0] == 2:
		return 2

	return 0  # No hay ganador

			




#Cuando el usuario se mete al circulo rojo se ejecuta esta funcion
func _on_area_2d_body_entered(body):
	if SeMueve:
		if(body.name == "playerlink"):
			ActualPlayer=1
			actualMoment+=1
		if(body.name == "playerlink2"):
			ActualPlayer=2
			actualMoment+=1
		changeMoment(actualMoment)
	pass 

func PanelShow():
	PanelPre.show()
	Option_1.show()
	Option_2.show()
	Option_3.show()
	Option_4.show()
	
func PanelHide():
	PanelPre.hide()
	Option_1.hide()
	Option_2.hide()
	Option_3.hide()
	Option_4.hide()
		
#En la siguiente funcion se establecen las preguntas, las 4 opciones y la respuesta para lo 10 momentos que existen
#El momento 0 es el inicio 
#(los return no hacen nada)

#Momento Inicio (0) - instrucciones 
#Momento Preguntas(1,3,5,7,9) - Tiempo para seleccionar respuesta
#Momento respuestas(2,4,6,8,10) - Tiempo donde se dice si la respuesta es correcta o incorrecta
func changeMoment(decimal):
	if decimal == 0:   #INICIO
		bubbleText.text = "Bienvenidos al combate por el conocimiento, hare una cuenta regresiva y deberan correr a la meta para tener la oportunidad de responder mis preguntas"
		
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		
		return "000"
	elif decimal == 1: # Conteo
		SeCuenta=true

		return "001"
	elif decimal == 2: #Ya
		SeCuenta=false
		bubbleText.text = "Ya!"
		SeMueve=true
		
		return "010"
	elif decimal == 3: # Preg 1
		SeMueve=false
		SePregunta=true
		PanelShow()
		
		AnswerColor = "p"
		bubbleText.text = "Player "+str(ActualPlayer)+", Filósofos que postulan las ideas innatas en el sujeto:"
		
		Option_1.text = "Empiristas"
		Option_2.text = "Idealistas"
		Option_3.text = "Racionalistas"
		Option_4.text = "Innatistas"
	#
		return "011"
	elif decimal == 4: #Resp 1
		SePregunta=false
		PanelHide()
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Racionalistas)"

		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Racionalistas)"
			if ActualPlayer == 1:
				hearts-=1
			else:
				hearts2-=1
			equis.show()
			
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "100"
	elif decimal == 5: # Conteo
		equis.hide()
		SeCuenta=true

		return "001"
	elif decimal == 6: #Ya
		SeCuenta=false
		bubbleText.text = "Ya!"
		SeMueve=true
		
		return "010"
	elif decimal == 7: # Preg 1
		SeMueve=false
		SePregunta=true
		PanelShow()
		
		AnswerColor = "p"
		bubbleText.text = "Player "+str(ActualPlayer)+", De los siguientes filósofos selecciones el que no se considera Racionalista:"
		
		Option_1.text = "David Hume"
		Option_2.text = "John Locke"
		Option_3.text = "Nicolas Malebranch"
		Option_4.text = "Francis Bacon"
	#
		return "011"
	elif decimal == 8: #Resp 1
		SePregunta=false
		PanelHide()
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Nicolas Malebranch)"

		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Nicolas Malebranch)"
			if ActualPlayer == 1:
				hearts-=1
			else:
				hearts2-=1
			equis.show()
			
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "100"
	elif decimal == 9: # Conteo
		equis.hide()
		SeCuenta=true

		return "001"
	elif decimal == 10: #Ya
		SeCuenta=false
		bubbleText.text = "Ya!"
		SeMueve=true
		
		return "010"
	elif decimal == 11: # Preg 1
		SeMueve=false
		SePregunta=true
		PanelShow()
		
		AnswerColor = "b"
		bubbleText.text = "Player "+str(ActualPlayer)+", Es la doctrina que establece que todos nuestros conocimientos provienen de la razón:"
		
		Option_1.text = "Empirismo"
		Option_2.text = "Criticismo"
		Option_3.text = "Epistemología"
		Option_4.text = "Racionalismo"
	#
		return "011"
	elif decimal == 12: #Resp 1
		SePregunta=false
		PanelHide()
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Racionalismo)"

		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Racionalismo)"
			if ActualPlayer == 1:
				hearts-=1
			else:
				hearts2-=1
			equis.show()
			
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "100"
	elif decimal == 13: # Conteo
		equis.hide()
		SeCuenta=true

		return "001"
	elif decimal == 14: #Ya
		SeCuenta=false
		bubbleText.text = "Ya!"
		SeMueve=true
		
		return "010"
	elif decimal == 15: # Preg 1
		SeMueve=false
		SePregunta=true
		PanelShow()
		
		AnswerColor = "b"
		bubbleText.text = "Player "+str(ActualPlayer)+", Uno de los siguientes filósofos, postula las ideas innatas en el sujeto:"
		
		Option_1.text = "Leibniz"
		Option_2.text = "George Berkeley"
		Option_3.text = "David Hume"
		Option_4.text = "Hipatía"
	#
		return "011"
	elif decimal == 16: #Resp 1
		SePregunta=false
		PanelHide()
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Leibniz)"

		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Leibniz)"
			if ActualPlayer == 1:
				hearts-=1
			else:
				hearts2-=1
			equis.show()
			
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "100"
	
	elif decimal == 16: #Resp 1
		equis.hide()
		if hearts == hearts2:
			bubbleText.text = "Tenemos un empate, ahora regresan a Inicio"
		if hearts > hearts2:
			bubbleText.text = "Jugador 1 Gana, ahora regresan a Inicio "
		if hearts < hearts2:
			bubbleText.text = "Jugador 2 Gana, ahora regresan a Inicio"
	
		return "100"
	elif decimal == 17: #Resp 1
		equis.hide()
		print("AAAAAAAAAAAAAAAa")
		if hearts == hearts2:
			bubbleText.text = "ATenemos un empate, ahora regresan a Inicio"
		if hearts > hearts2:
			bubbleText.text = "Jugador 1 Gana, ahora regresan a Inicio "
		if hearts < hearts2:
			bubbleText.text = "Jugador 2 Gana, ahora regresan a Inicio"
		
		return "100"	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	elif decimal == -1:

		if hearts == hearts2:
			bubbleText.text = "Tenemos un empate, ahora regresan a Inicio"
		if hearts > hearts2:
			bubbleText.text = "Jugador 1 Gana, ahora regresan a Inicio "
		if hearts < hearts2:
			bubbleText.text = "Jugador 2 Gana, ahora regresan a Inicio"
		
		
		return "111"
	elif decimal == -2:
		print("AAAAAAAAAAAAAAAa")
		if hearts == hearts2:
			bubbleText.text = "ATenemos un empate, ahora regresan a Inicio"
		if hearts > hearts2:
			bubbleText.text = "Jugador 1 Gana, ahora regresan a Inicio "
		if hearts < hearts2:
			bubbleText.text = "Jugador 2 Gana, ahora regresan a Inicio"
		
		var change_scene2 = load("res://mundo.tscn")
		get_tree().change_scene_to_packed(change_scene2)
		change_scene2.instantiate()
		return "111"
	else:
		
		return "NA"
	pass




func _on_option_1_gui_input(event):
	print("clicked")
	pass # Replace with function body.







func _on_option_1_focus_entered():
	pass # Replace with function body.
