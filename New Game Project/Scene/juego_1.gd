extends Node2D

#Animacion del link que hace las preguntas
@onready var animationsEnemy = $Enemy/AnimatedSprite2D
#Burbujita de texto (solo la imagen)
@onready var bubbledialog = $PointLight2D/Sprite2D
#Texto dentro de la burbujita
@onready var bubbleText = $PointLight2D/Sprite2D/RichTextLabel

#Points son los 4 puntos de colores que se usan para seleccionar la respuesta
@onready var Point_1 = $Point1
@onready var Point_2 = $Point2
@onready var Point_3 = $Point3
@onready var Point_4 = $Point4

#Options, son los 4 textos donde cada uno tiene 1 opcion de las respuestas de una pregunta
@onready var Option_1 = $Option1
@onready var Option_2 = $Option2
@onready var Option_3 = $Option3
@onready var Option_4 = $Option4


#El player, lo llamo para saber si esta sobre una respuesta
@onready var Player = $playerlink

#cheque, es el cheque verde que se muestra cuando se responde bien
@onready var cheque = $cheque
# Es la x que se muestra cuando se responde mal
@onready var equis = $twitter

# El corazon 1 y 2, el 3ro no lo necesito porque cuando solo queda ese y se falla de un solo
# perdemos
@onready var Heart2 = $Heart2
@onready var Heart3 = $Heart3

var RespuestasCorrectas=0
var RespuestasIncorrectas=0
var AnswerColor = "" #Color de respuesta, puede ser r g b o p
var actualMoment = 0  # el momento actual, determina si estamos en el inicio, una pregunta, cuando se dice si es correcta o no
var ResponseColor = "" #Es el color en donde colocamos el personaje y lo comparamos con la respuesta real
var hearts = 3 # el numero de corazones que tenemos al inicio
var regresarInicio=false
func _ready():
	$Background_Music.play()
	#Todo esto se ejecuta al inicio, reiniciamos el tiempo
	#establecemos el primer momento (que es Inicio {0})
	# iniciamos la animacion del link que habla y decimos que aun no se muestra el cheque
	# o la x
	Time_Reset()
	changeMoment(actualMoment)
	animationsEnemy.play()
	cheque.hide()
	equis.hide()
	pass # Replace with function body.


#establezco las variables del tiempo
var seconds=0
var minutes=0
var Dseconds=10
var Dminutes=0


func _process(delta):
	if(RespuestasCorrectas>=7):
		_Ganastes()
		$You_Win.play()
	


#esta funcion se ejecuta cada segundo, es para determinar el tiempo que ha pasado
#y cada 10 segundos verifica si se quedo sin vidas y si no 
#entonces se hace un cambio de momento pasamos de 
# Inicio a Pregunta y de Pregunta a Respuesta y luego devuelta a Pregunta
func _on_timer_timeout():
	if seconds == 0:
		if minutes > 0: 
			minutes -=1 
			seconds=60
			
	if seconds > 0:
		seconds-=1
	else: 
		actualMoment+=1
		if !regresarInicio: 
			if hearts == 0: 
				actualMoment=-1
				regresarInicio=true
		else: 
			actualMoment=-2
		changeMoment(actualMoment)
		HeartsChanger()
		Time_Reset()
		
	$Label.text = str(minutes)+" : "+str(seconds) #Con esto pongo el temporizador en la izquierda arriba
	
	pass 

#esta funcion determina cuantos corazones hay que mostrar
func HeartsChanger():
	if hearts == 2:
		Heart3.hide()
	elif hearts == 1:
		Heart2.hide()

#Reinicia el tiempo despues de 10 segundos
func Time_Reset():
	seconds=Dseconds
	minutes=Dminutes

#Oculta la X y el Cheque despues de ya mostrarlos
func ResetChecker():
	cheque.hide()
	equis.hide()




#Cuando el usuario se mete al circulo rojo se ejecuta esta funcion
func _on_area_2d_body_entered(body):
	
	print("rojo")
	ResponseColor = "r"
	pass 

#Cuando el usuario se mete al circulo verde se ejecuta esta funcion
func _on_area_2d_2_body_entered(body):
	print("verde")
	ResponseColor = "g"
	pass 

#Cuando el usuario se mete al circulo azul se ejecuta esta funcion
func _on_area_2d_3_body_entered(body):
	print("azul")
	ResponseColor = "b"
	pass 

#Cuando el usuario se mete al circulo morado se ejecuta esta funcion
func _on_area_2d_4_body_entered(body):
	print("morado")
	ResponseColor = "p"
	pass 


#En la siguiente funcion se establecen las preguntas, las 4 opciones y la respuesta para lo 10 momentos que existen
#El momento 0 es el inicio 
#(los return no hacen nada)

#Momento Inicio (0) - instrucciones 
#Momento Preguntas(1,3,5,7,9) - Tiempo para seleccionar respuesta
#Momento respuestas(2,4,6,8,10) - Tiempo donde se dice si la respuesta es correcta o incorrecta
func changeMoment(decimal):
	if decimal == 0:   #INICIO
		bubbleText.text = "Bienvenido a las tumbas del conocimiento, te hare unas preguntas y deberas moverte de lugar para responderlas."
		
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		return "000"
	elif decimal == 1: # Preg 1
		AnswerColor = "b"
		bubbleText.text = "Después del feudalismo medieval acudimos al surgimiento de una nueva clase social conocida como la: " 
		
		Option_1.text = "La monarquía"
		Option_2.text = "El mercantilismo"
		Option_3.text = "La burguesía"
		Option_4.text = "El proletariado"
		ResetChecker()
		return "001"
	elif decimal == 2: 
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (La burguesía)"
			RespuestasCorrectas+=1
			cheque.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es La burguesía"
			equis.show()
			hearts-=1
			
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		return "010"
	elif decimal == 3: # Preg 2
		AnswerColor = "g"
		bubbleText.text = "El renacimiento supone una época de absolutismo y nacionalismos, como el nacimiento de fuertes
monarquías europeas centralizadas como:"
		
		Option_1.text = "Grecia"
		Option_2.text = "Inglaterra"
		Option_3.text = "Yugoslavia"
		Option_4.text = "Egipto"
		ResetChecker()
		return "011"
	elif decimal == 4:
		
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Inglaterra)"
			RespuestasCorrectas+=1
			cheque.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Inglaterra)"
			hearts-=1
			equis.show()
			
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "100"
	elif decimal == 5: # Preg 3
		AnswerColor = "r"
		bubbleText.text = "Antes de la consolidación del estado moderno, Italia estuvo divida en pequeñas ciudades-estado
normalmente enfrentadas entre si, como es el caso de:"
		
		Option_1.text = "Florencia-Napoli"
		Option_2.text = "Ámsterdam-Cracovia"
		Option_3.text = "Reims-Colonia"
		Option_4.text = "Milán-Lourdes"
		ResetChecker()
		return "101"
	elif decimal == 6:
		
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Florencia-Napoli)"
			RespuestasCorrectas+=1
			cheque.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Florencia-Napoli)"
			hearts-=1
			equis.show()
		
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "110"
	elif decimal == 7:# Preg 4
		AnswerColor = "g"
		bubbleText.text = "La toma de Constantinopla supone un bloqueo comercial entre Europa y Asia (la ruta de la seda) y ocurrió
en lo que hoy es actualmente:"
		
		Option_1.text = "Eslovaquia"
		Option_2.text = "Estambul en Turquía"
		Option_3.text = "Mesopotamia"
		Option_4.text = "Jerusalén"
		ResetChecker()
		return "111"
	elif decimal == 8:
		
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Estambul en Turquía)"
			RespuestasCorrectas+=1
			actualMoment=-2
			cheque.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Estambul en Turquía)"
			hearts-=1
			equis.show()
			
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "111"
	elif decimal == 9:# Preg 5
		AnswerColor = "r"
		bubbleText.text = "Resurge el interés por Grecia y Roma, junto al declive del sistema feudal, el crecimiento del comercio e
innovaciones entre las que mencionamos:"
		
		Option_1.text = "La imprenta y la brújula"
		Option_2.text = "La rueda y la escritura"
		Option_3.text = "Las máquinas y la producción"
		Option_4.text = "La pólvora y La rueda"
		ResetChecker()
		return "111"
	elif decimal == 10:
		
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (La imprenta y la brújula)"
			RespuestasCorrectas+=1
			cheque.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (La imprenta y la brújula)"
			hearts-=1
			equis.show()
		Option_1.text = ""
		Option_2.text = ""
		Option_3.text = ""
		Option_4.text = ""
		
		return "111"
	elif decimal == 11:
		
		bubbleText.text = "Ganaste, lograste responder correctamente las suficientes preguntas, vuelves a la Ruleta"
		return "111"
	elif decimal == 11:
		
		bubbleText.text = "Ganaste, lograste responder correctamente las suficientes preguntas, vuelves a la Ruleta"
		#var change_scene2 = load("res://mundo.tscn")
		#get_tree().change_scene_to_packed(change_scene2)
		#change_scene2.instantiate()
		return "111"
	elif decimal == -1:
		$Background_Music.stop()
		$You_Lose.play()
		$Button/Label.text = "PERDISTE!"
		equis.hide()
		$Button.show()
		$PointLight2D/Sprite2D.hide()
		bubbleText.text = "te quedaste sin vidas, vuelves a la Ruleta"
	
		
		return "111"
	elif decimal == -2:
		equis.hide()
		#var change_scene2 = load("res://mundo.tscn")
		#get_tree().change_scene_to_packed(change_scene2)
		#change_scene2.instantiate()
		
		
		return "111"
	else:
		ResetChecker()
		return "NA"
	pass

func _Ganastes():
	$Background_Music.stop()
	$You_Win.play()
	$Button/Label.text = "GANASTE!"
	$PointLight2D/Sprite2D.hide()
	Main.Vida_base+=20
	bubbleText.text = "Ganaste, lograste responder correctamente las suficientes preguntas, vuelves a la Ruleta"
	$Button.show()
	$Button.show()
func _on_button_pressed():
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="royal"
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("EleccionGame")[0].queue_free()
