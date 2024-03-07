extends Node2D
var num = 1
var RespuestaCorrectaAula
var RespuestaUserAula

# Called when the node enters the scene tree for the first time.
func _ready():
	QuestionsLab()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func QuestionsLab():
	#num =randi()%6
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
		


func respuesta():
	if RespuestaCorrectaAula==RespuestaUserAula:
		$Sprite2D.frame+=1
		$Control/ProgressBar.value += 50 * 100/ 100
		QuestionsLab()
		if $Control/ProgressBar.value >= 100:
					$Regresar.show()
					print("Barra llena")
	else:
		$Control/ProgressBar.value -= 50 * 100/ 100
		print("Fallastes")
	
	
	
func _on_a_pressed():
	
	RespuestaUserAula="Conocimiento fenoménico"
	respuesta()
	


func _on_b_pressed():
	pass # Replace with function body.


func _on_c_pressed():
	pass # Replace with function body.


func _on_d_pressed():
	pass # Replace with function body.


func _on_regresar_pressed():
	pass # Replace with function body.
