extends Node2D

var num=0
var RespuestaCorrectaAula=""
var RespuestaUserAula

# Called when the node enters the scene tree for the first time.
func _ready():
	$Regresar.hide()
	QuestionsLab()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func QuestionsLab():
	num =randi()%6
	if num==0:
		$Control/Preguntas.text="Seleccione el mandato cuya obligación\nviene del miedo al castigo o la \nbúsqueda de un premio:
A) Imperativo Hipotético. \nB) Imperativo categórico. \nC) Ambos. D) Ninguno"
		RespuestaCorrectaAula="Imperativo Hipotético"
	elif num==1:
		$Control/Preguntas.text="Para Emanuel Kant, es posible conocer lo \nque las cosas nos permiten (como lo \nsuperficial) a través de nuestros \nsentidos:
A) Conocimiento Noumenico. \nB) Conocimiento fenoménico. \nC) conocimiento Empírico"
		RespuestaCorrectaAula="Conocimiento fenoménico"
	elif num==2:
		$Control/Preguntas.text="Kant decía que el lema de la nilustración \nera “Sapere aude”, que significa:
A) Sopesa tus acciones. \nB) Atrévete a saber por ti mismo. \nC) Saber a la fuerza.\nD) Someterse al conocimiento"
		RespuestaCorrectaAula="Atrévete a saber por ti mismo"
	elif num==3:
		$Control/Preguntas.text="Kant (igual que Copérnico cambió el \ncentro del universo de la tierra al sol),\ncambia el centro del conocimiento del \nobjeto al sujeto, a esto se le llama:
A) Subjetivismo. B) Prejuicio. \nC) giro copernicano. D) Suerte"
		RespuestaCorrectaAula="giro copernicano"
	if num==4:
		$Control/Preguntas.text="La postura conciliadora de Kant \nrespecto a los empiristas y \nracionalistas define que los datos
experimentales son la fuente del \nconocimiento racional del sujeto:
A) Racionalismo. B) Empirismo. \nC) Criticismo. D) Escepticismo"
		RespuestaCorrectaAula="Criticismo"
	if num==5:
		$Control/Preguntas.text="De las siguientes obras de Emanuel Kant, \nseleccione aquella que define su \nepistemología:
A) Critica de la razón práctica. \nB) Critica de la razón pura. \nC) Critica del juicio. D) Critica
fenomenológica"
		RespuestaCorrectaAula="Critica de la razón pura"
		

func _on_button_pressed():
	if num==0:
		RespuestaUserAula="Imperativo Hipotético"
	elif num==1:
		RespuestaUserAula="Conocimiento Noumenico"
	elif num==2:
		RespuestaUserAula="Sopesa tus acciones"
	elif num==3:
		RespuestaUserAula="Subjetivismo"
	elif num==4:
		RespuestaUserAula="Racionalismo"
	elif num==5:
		RespuestaUserAula="Critica de la razón práctica"
	
	
	var rotation = $Area2D3/CollisionShape2D.rotation
	
	rotation += 90
	print(rotation)  # Cambia la rotación en sentido de las agujas del reloj
	if rotation >= 360:
		rotation -= 360 
		respuesta()
		# Asegura que la rotación esté dentro del rango de 0 a 360 grados
	$Area2D3/CollisionShape2D.rotation = rotation
	
	
func respuesta():
	if RespuestaCorrectaAula==RespuestaUserAula:
		$Control/ProgressBar.value += 50 * 100/ 100
		QuestionsLab()
		if $Control/ProgressBar.value >= 100:
					$Regresar.show()
					print("Barra llena")
	else:
		$Control/ProgressBar.value -= 50 * 100/ 100
		print("Fallastes")
	
	


func _on_button_2_pressed():
	
	if num==0:
		RespuestaUserAula="Imperativo categórico"
	elif num==1:
		RespuestaUserAula="Conocimiento fenoménico"
	elif num==2:
		RespuestaUserAula="Atrévete a saber por ti mismo"
	elif num==3:
		RespuestaUserAula="Prejuicio"
	elif num==4:
		RespuestaUserAula="Empirismo"
	elif num==5:
		RespuestaUserAula="Critica de la razón pura"
	
	var rotation = $Area2D2/CollisionShape2D.rotation
	
	rotation += 90  
	if rotation >= 360:
		rotation -= 360 
		respuesta()
	$Area2D2/CollisionShape2D.rotation = rotation


func _on_button_3_pressed():
	
	if num==0:
		RespuestaUserAula="Ninguno"
	elif num==1:
		RespuestaUserAula="Conocimiento Racional"
	elif num==2:
		RespuestaUserAula="Someterse al conocimiento"
	elif num==3:
		RespuestaUserAula="Suerte"
	elif num==4:
		RespuestaUserAula="Escepticismo"
	elif num==5:
		RespuestaUserAula="Critica fenomenológica"
	
	
	
	var rotation = $Area2D/CollisionShape2D.rotation
	rotation += 90  
	if rotation >= 360:
		rotation -= 360 
		respuesta()
	$Area2D/CollisionShape2D.rotation = rotation


func _on_button_4_pressed():
	if num==0:
		RespuestaUserAula="Ambos"
	elif num==1:
		RespuestaUserAula="conocimiento Empírico"
	elif num==2:
		RespuestaUserAula="Saber a la fuerza"
	elif num==3:
		RespuestaUserAula="giro copernicano"
	elif num==4:
		RespuestaUserAula="Criticismo"
	elif num==5:
		RespuestaUserAula="Critica del juicio"
	
		
	var rotation = $Area2D4/CollisionShape2D.rotation
	rotation += 90  
	if rotation >= 360:
		rotation -= 360 
		respuesta()
	$Area2D4/CollisionShape2D.rotation = rotation


func _on_regresar_pressed():
	$".".hide()
	$"../../../AnimatableBody2D".show()
