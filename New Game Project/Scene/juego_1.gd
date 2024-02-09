extends Node2D

@onready var animationsEnemy = $Enemy/AnimatedSprite2D
@onready var bubbledialog = $Sprite2D
@onready var bubbleText = $Sprite2D/RichTextLabel

@onready var Point_1 = $Point1
@onready var Point_2 = $Point2
@onready var Point_3 = $Point3
@onready var Point_4 = $Point4

@onready var Option_1 = $Option1
@onready var Option_2 = $Option2
@onready var Option_3 = $Option3
@onready var Option_4 = $Option4
# Called when the node enters the scene tree for the first time.
@onready var Player = $playerlink

@onready var cheque = $cheque
@onready var equis = $twitter

@onready var Heart2 = $Heart2
@onready var Heart3 = $Heart3

var AnswerColor = ""
var actualMoment = 0 
var ResponseColor = ""
var hearts = 3

func _ready():
	Time_Reset()
	changeMoment(actualMoment)
	animationsEnemy.play()
	cheque.hide()
	equis.hide()
	#bubbledialog.hide()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var seconds=0
var minutes=0
var Dseconds=10
var Dminutes=0


func _process(delta):
	#print(Player.get_position())
	pass


func _on_timer_timeout():
	if seconds == 0:
		if minutes > 0: 
			minutes -=1 
			seconds=60
			
	if seconds > 0:
		seconds-=1
	else: 
		actualMoment+=1
		if hearts == 0: 
			actualMoment=-1
		changeMoment(actualMoment)
		HeartsChanger()
		Time_Reset()
		
	
	$Label.text = str(minutes)+" : "+str(seconds)
	
	pass # Replace with function body.

func HeartsChanger():
	if hearts == 2:
		Heart3.hide()
	elif hearts == 1:
		Heart2.hide()

func Time_Reset():
	seconds=Dseconds
	minutes=Dminutes

func ResetChecker():
	cheque.hide()
	equis.hide()

func _on_collision_shape_2d_child_entered_tree(node):
	print("rojo")
	pass # Replace with function body.




func _on_area_2d_body_entered(body):
	
	print("rojo")
	ResponseColor = "r"
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):
	print("verde")
	ResponseColor = "g"
	pass # Replace with function body.


func _on_area_2d_3_body_entered(body):
	print("azul")
	ResponseColor = "b"
	pass # Replace with function body.


func _on_area_2d_4_body_entered(body):
	print("morado")
	ResponseColor = "p"
	pass # Replace with function body.


#Momento impar - instrucciones o respuesta correcta
#Momento par - Tiempo para seleccionar respuesta
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
	elif decimal == -1:
		equis.hide()
		bubbleText.text = "Perdiste, te quedaste sin vidas"
		
		
		return "111"
	else:
		ResetChecker()
		return "NA"
	pass
