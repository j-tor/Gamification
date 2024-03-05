extends Node2D
var PreguntaAula
var RespuestaCorrectaAula
var RespuestaUserAula
var num
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_entradas_area_entered(area):
	$playerlink.position=Vector2(121,1071)
	


func _on_entrada_a_pasillo_area_entered(area):
	$playerlink.position=Vector2(114,52)

func _on_salidas_a_lobby_area_entered(area):
	$playerlink.position=Vector2(105,444)


func _on_salida_a_pasillo_area_entered(area):
	$playerlink.position=Vector2(103,103)


func _on_salida_del_lab_area_entered(area):
	$playerlink.position=Vector2(126,1008)


func _on_entrada_a_lab_area_entered(area):
	$playerlink.position=Vector2(1134,924)


func _on_entro_a_aula_area_entered(area):
	print("entre")
	$HechoPorKenny/BoxContainer/CerrarEntrada/CollisionShape2D.position= Vector2(246,998)


func _on_hacia_biblio_area_entered(area):
	$playerlink.position=Vector2(584,746)


func _on_hacia_aula_area_entered(area):
	$playerlink.position=Vector2(460,1033)


func _on_pergamino_area_entered(area):
	print("Entre a pergamino normal")
	QuestionsAula()
	$playerlink/Camera2D/ParaPreguntasAula.show()


func _on_libro_area_entered(area):
	print("Entro a libro")
	QuestionsAula()
	$playerlink/Camera2D/ParaPreguntasAula.show()


func _on_area_2d_area_entered(area):
	print("Entraste a planta")
	QuestionsAula()
	$playerlink/Camera2D/ParaPreguntasAula.show()

func QuestionsAula():
	num =randi()%6
	if num==0:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Seleccione el mandato cuya obligación viene del miedo al castigo o la búsqueda de un premio:
A) Imperativo Hipotético. B) Imperativo categórico. C) Ambos. D) Ninguno"
		RespuestaCorrectaAula="Imperativo Hipotético"
	elif num==1:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Para Emanuel Kant, es posible conocer lo que las cosas nos permiten (como lo superficial) a
través de nuestros sentidos:
A) Conocimiento Noumenico. B) Conocimiento fenoménico. C) conocimiento Empírico"
		RespuestaCorrectaAula="Conocimiento fenoménico"
	elif num==2:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Kant decía que el lema de la ilustración era “Sapere aude”, que significa:
A) Sopesa tus acciones. B) Atrévete a saber por ti mismo. C) Saber a la fuerza.D) Someterse al conocimiento"
		RespuestaCorrectaAula="Atrévete a saber por ti mismo"
	elif num==3:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Kant (igual que Copérnico cambió el centro del universo de la tierra al sol), cambia el centro
del conocimiento del objeto al sujeto, a esto se le llama:
A) Subjetivismo. B) Prejuicio. C) giro copernicano. D) Suerte"
		RespuestaCorrectaAula="giro copernicano"
	if num==4:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="La postura conciliadora de Kant respecto a los empiristas y racionalistas define que los datos
experimentales son la fuente del conocimiento racional del sujeto:
A) Racionalismo. B) Empirismo. C) Criticismo. D) Escepticismo"
		RespuestaCorrectaAula="Criticismo"
	if num==5:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="De las siguientes obras de Emanuel Kant, seleccione aquella que define su epistemología:
A) Critica de la razón práctica. B) Critica de la razón pura. C) Critica del juicio. D) Critica
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
	validarRespuestasAula()


func _on_respuesta_b_pressed():
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
	validarRespuestasAula()


func _on_respuesta_c_pressed():
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
	validarRespuestasAula()


func _on_respuesta_d_pressed():
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
	validarRespuestasAula()

func validarRespuestasAula():
	if RespuestaCorrectaAula==RespuestaUserAula:
		print("Respondio bien")
	else:
		print("Fallastes")
	$playerlink/Camera2D/ParaPreguntasAula.hide()


func _on_pizarra_area_entered(area):
	QuestionsAula()
	$playerlink/Camera2D/ParaPreguntasAula.show()


func _on_estante_area_entered(area):
	QuestionsAula()
	$playerlink/Camera2D/ParaPreguntasAula.show()


func _on_estante_2_area_entered(area):
	QuestionsAula()
	$playerlink/Camera2D/ParaPreguntasAula.show()


func _on_estante_3_area_entered(area):
	QuestionsAula()
	$playerlink/Camera2D/ParaPreguntasAula.show()
