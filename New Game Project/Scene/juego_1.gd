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

var num=6


var RespuestasCorrectas=0
var RespuestasIncorrectas=0
var AnswerColor = "" #Color de respuesta, puede ser r g b o p
var actualMoment = 0  # el momento actual, determina si estamos en el inicio, una pregunta, cuando se dice si es correcta o no
var ResponseColor = "" #Es el color en donde colocamos el personaje y lo comparamos con la respuesta real
var hearts = 4 # el numero de corazones que tenemos al inicio
var regresarInicio=false

func _ready():
	bubbleText.text = "Bienvenido a las tumbas del conocimiento, te hare unas preguntas y deberas moverte de lugar para responderlas."
	Option_1.text = ""
	Option_2.text = ""
	Option_3.text = ""
	Option_4.text = ""
	await get_tree().create_timer(8).timeout
	QuestionsLab()
	$Background_Music.play()
	#changeMoment(actualMoment)
	animationsEnemy.play()
	cheque.hide()
	equis.hide()
	
	pass # Replace with function body.


#establezco las variables del tiempo
var seconds=0
var minutes=0
var Dseconds=10
var Dminutes=0

''
func _process(delta):

	HeartsChanger()
	if(RespuestasCorrectas>=6):
		_Ganastes()
		$You_Win.play()
		
	if RespuestasIncorrectas>= 6:
		_lose()
		$You_Lose.play()
	

func respuesta():
	
	await get_tree().create_timer(4).timeout
	
	if num == 0:
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (La burguesía)"
			RespuestasCorrectas+=1
			cheque.show()
			$Azul.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es La burguesía"
			equis.show()
			RespuestasIncorrectas+=1
			hearts-=1
		#Option_1.text = ""
		#Option_2.text = ""
		#Option_3.text = ""
		#Option_4.text = ""
		await get_tree().create_timer(4).timeout
		ResetChecker()
		QuestionsLab()
	elif num == 1:
		
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Inglaterra)"
			RespuestasCorrectas+=1
			cheque.show()
			$Yellow.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Inglaterra)"
			hearts-=1
			RespuestasIncorrectas+=1
			equis.show()
		await get_tree().create_timer(4).timeout
		ResetChecker()
		QuestionsLab()
	elif num == 2:
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Florencia-Napoli)"
			RespuestasCorrectas+=1
			cheque.show()
			$Red.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Florencia-Napoli)"
			hearts-=1
			RespuestasIncorrectas+=1
			equis.show()
		await get_tree().create_timer(4).timeout
		ResetChecker()
		QuestionsLab()
		
	elif num == 3:
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (Estambul en Turquía)"
			RespuestasCorrectas+=1
			actualMoment=-2
			cheque.show()
			$Yellow.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (Estambul en Turquía)"
			hearts-=1
			RespuestasIncorrectas+=1
			equis.show()
		await get_tree().create_timer(4).timeout
		ResetChecker()
		QuestionsLab()
	elif num == 4:
		if ResponseColor == AnswerColor:
			bubbleText.text = "Respuesta Correcta (La imprenta y la brújula)"
			RespuestasCorrectas+=1
			cheque.show()
			$Red.show()
		else: 
			bubbleText.text = "Incorrecto, la respuesta es (La imprenta y la brújula)"
			hearts-=1
			RespuestasIncorrectas+=1
			equis.show()
		await get_tree().create_timer(4).timeout
		ResetChecker() 
		QuestionsLab()  
	HeartsChanger()
		
		
#esta funcion se ejecuta cada segundo, es para determinar el tiempo que ha pasado
#y cada 10 segundos verifica si se quedo sin vidas y si no 
#entonces se hace un cambio de momento pasamos de 
# Inicio a Pregunta y de Pregunta a Respuesta y luego devuelta a Pregunta
 


func HeartsChanger():
	if hearts == 3:
		Heart3.hide()
	elif hearts == 1:
		Heart2.hide()



#Oculta la X y el Cheque despues de ya mostrarlos
func ResetChecker():
	cheque.hide()
	equis.hide()




#Cuando el usuario se mete al circulo rojo se ejecuta esta funcion
func _on_area_2d_body_entered(body):
	
	print("rojo")
	ResponseColor = "r"
	respuesta()
	pass 

#Cuando el usuario se mete al circulo verde se ejecuta esta funcion
func _on_area_2d_2_body_entered(body):
	print("verde")
	ResponseColor = "g"
	respuesta()
	pass 

#Cuando el usuario se mete al circulo azul se ejecuta esta funcion
func _on_area_2d_3_body_entered(body):
	print("azul")
	ResponseColor = "b"
	respuesta()
	pass 

#Cuando el usuario se mete al circulo morado se ejecuta esta funcion
func _on_area_2d_4_body_entered(body):
	print("morado")
	ResponseColor = "p"
	respuesta()
	pass 


#En la siguiente funcion se establecen las preguntas, las 4 opciones y la respuesta para lo 10 momentos que existen
#El momento 0 es el inicio 
#(los return no hacen nada)
func QuestionsLab():
	$Morado.hide()
	$Azul.hide() 
	$Red.hide()
	$Yellow.hide()
	Player.position=Vector2(23,100)
	num =randi()%5
	if num==0:
		AnswerColor = "b"
		bubbleText.text = "Después del feudalismo medieval acudimos al surgimiento de una nueva clase social conocida como la: " 
		
		Option_1.text = "La monarquía"
		Option_2.text = "El mercantilismo"
		Option_3.text = "La burguesía"
		Option_4.text = "El proletariado"
		ResetChecker()
		
	elif num==1:
		AnswerColor = "g"
		bubbleText.text = "El renacimiento supone una época de absolutismo y nacionalismos, como el nacimiento de fuertes
		monarquías europeas centralizadas como:"
		
		Option_1.text = "Grecia"
		Option_2.text = "Inglaterra"
		Option_3.text = "Yugoslavia"
		Option_4.text = "Egipto"
		ResetChecker()
	elif num==2:
		AnswerColor = "r"
		bubbleText.text = "Antes de la consolidación del estado moderno, Italia estuvo divida en pequeñas ciudades-estado
		normalmente enfrentadas entre si, como es el caso de:"
		
		Option_1.text = "Florencia-Napoli"
		Option_2.text = "Ámsterdam-Cracovia"
		Option_3.text = "Reims-Colonia"
		Option_4.text = "Milán-Lourdes"
		ResetChecker()
	elif num==3:
		AnswerColor = "g"
		bubbleText.text = "La toma de Constantinopla supone un bloqueo comercial entre Europa y Asia (la ruta de la seda) y ocurrió
		en lo que hoy es actualmente:"
		
		Option_1.text = "Eslovaquia"
		Option_2.text = "Estambul en Turquía"
		Option_3.text = "Mesopotamia"
		Option_4.text = "Jerusalén"
		ResetChecker()
	if num==4:
		AnswerColor = "r"
		bubbleText.text = "Resurge el interés por Grecia y Roma, junto al declive del sistema feudal, el crecimiento del comercio e
		innovaciones entre las que mencionamos:"
		
		Option_1.text = "La imprenta y la brújula"
		Option_2.text = "La rueda y la escritura"
		Option_3.text = "Las máquinas y la producción"
		Option_4.text = "La pólvora y La rueda"
		ResetChecker()

#Momento Inicio (0) - instrucciones 
#Momento Preguntas(1,3,5,7,9) - Tiempo para seleccionar respuesta
#Momento respuestas(2,4,6,8,10) - Tiempo donde se dice si la respuesta es correcta o incorrecta

func _Ganastes():
	Main.Vida_base+=20
	$Background_Music.stop()
	$You_Win.play()
	$Button/Label.text = "GANASTE!"
	$PointLight2D/Sprite2D.hide()
	Main.Vida_base+=20
	bubbleText.text = "Ganaste, lograste responder correctamente las suficientes preguntas, vuelves a la Ruleta"
	$Button.show()
	$Button.show()
	
func _lose():
	$Background_Music.stop()
	$You_Lose.play()
	$Button/Label.text = "PERDISTE!"
	$PointLight2D/Sprite2D.hide()
	Main.Vida_base+=20
	bubbleText.text = "te quedaste sin vidas, vuelves a la Ruleta"
	$Button.show()
	$Button.show()
	
func _on_button_pressed():
	
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="royal"
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("EleccionGame")[0].queue_free()
