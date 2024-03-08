extends Node2D
var PreguntaAula
var RespuestaCorrectaAula
var RespuestaUserAula
var num
var puntos=0
var unavez=false
var hablo=Main.habloWin
var onlyone=false
var startAula=false
var habloInicial=Main.hablo 
var perdio=false
var pergamino=0;
var termino=false
var cerro1=false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$playerlink/Camera2D/CanvasLayer/ProgressBar.value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	habloInicial=Main.hablo
	if startAula==true:
		Win()
	else :
		$playerlink/Camera2D/ParaPreguntasAula.hide()


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
	startAula=true
	cerro1=true
	$playerlink/Camera2D/CanvasLayer.show()
	$HechoPorKenny/BoxContainer/CerrarEntrada/CollisionShape2D.position= Vector2(246,998)


func _on_hacia_biblio_area_entered(area):
	$playerlink.position=Vector2(584,746)
	$EmanuelKant.position=Vector2(520,744)
	if unavez==false:
		Main.Emanuelstatus="Biblioteca"
		unavez==true
	elif unavez==true:
		Win()


func _on_hacia_aula_area_entered(area):
	$playerlink.position=Vector2(460,1033)
	$EmanuelKant.position=Vector2(287,937)
	if unavez==true:
		Win()


func _on_pergamino_area_entered(area):
	if pergamino<15:
		QuestionsAula()
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		pergamino+=1
	else:
		perdio=true
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
		await get_tree().create_timer(5).timeout
		$playerlink/Camera2D/ParaPreguntasAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_libro_area_entered(area):
	print("Entro a libro")
	if pergamino<15:
		QuestionsAula()
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		pergamino+=1
	else:
		perdio=true
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
		await get_tree().create_timer(5).timeout
		$playerlink/Camera2D/ParaPreguntasAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_area_2d_area_entered(area):
	print("Entraste a planta")
	if pergamino<15:
		QuestionsAula()
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		pergamino+=1
	else:
		perdio=true
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
		await get_tree().create_timer(5).timeout
		$playerlink/Camera2D/ParaPreguntasAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()

func QuestionsAula():
	num =randi()%6
	$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
	if num==0:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Seleccione el mandato cuya obligación\nviene del miedo al castigo o la \nbúsqueda de un premio:
A) Imperativo Hipotético. \nB) Imperativo categórico. \nC) Ambos. D) Ninguno"
		RespuestaCorrectaAula="Imperativo Hipotético"
	elif num==1:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Para Emanuel Kant, es posible conocer lo \nque las cosas nos permiten (como lo \nsuperficial) a través de nuestros \nsentidos:
A) Conocimiento Noumenico. \nB) Conocimiento fenoménico. \nC) conocimiento Empírico"
		RespuestaCorrectaAula="Conocimiento fenoménico"
	elif num==2:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Kant decía que el lema de la nilustración \nera “Sapere aude”, que significa:
A) Sopesa tus acciones. \nB) Atrévete a saber por ti mismo. \nC) Saber a la fuerza.\nD) Someterse al conocimiento"
		RespuestaCorrectaAula="Atrévete a saber por ti mismo"
	elif num==3:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="Kant (igual que Copérnico cambió el \ncentro del universo de la tierra al sol),\ncambia el centro del conocimiento del \nobjeto al sujeto, a esto se le llama:
A) Subjetivismo. B) Prejuicio. \nC) giro copernicano. D) Suerte"
		RespuestaCorrectaAula="giro copernicano"
	if num==4:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="La postura conciliadora de Kant \nrespecto a los empiristas y \nracionalistas define que los datos
experimentales son la fuente del \nconocimiento racional del sujeto:
A) Racionalismo. B) Empirismo. \nC) Criticismo. D) Escepticismo"
		RespuestaCorrectaAula="Criticismo"
	if num==5:
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.text="De las siguientes obras de Emanuel Kant, \nseleccione aquella que define su \nepistemología:
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
		$playerlink/Camera2D/CanvasLayer/ProgressBar.value += 10 * 100/ 100
		if $playerlink/Camera2D/CanvasLayer/ProgressBar.value <= 0:
				print("Barra llena")
	else:
		print("Fallastes")
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	Win()

func Win():
	if $playerlink/Camera2D/CanvasLayer/ProgressBar.value >= 60 && perdio==false:
		Main.Ancianostatus="Gano"
		if onlyone==false:
			pass
		else:
			onlyone=true
		if onlyone==false:
			$EmanuelKant.Gano()
			$HechoPorKenny/BoxContainer/CerrarEntrada/CollisionShape2D.position= Vector2(5000,5000)
			onlyone==true;
			await get_tree().create_timer(3).timeout
			$EmanuelKant.parar()
		termino=true
	elif $playerlink/Camera2D/CanvasLayer/ProgressBar.value <60 && perdio==false:
		termino=true
		Main.Ancianostatus="No gano"
	elif perdio==true:
		termino=true
		Main.Ancianostatus="Perdio"
		$HechoPorKenny/BoxContainer/CerrarEntrada/CollisionShape2D.position= Vector2(5000,5000)

func finish():
	$HechoPorKenny/BoxContainer/CerrarEntrada/CollisionShape2D.position= Vector2(246,998)
	$HechoPorKenny/cambio/CollisionShape2D.position= Vector2(246,998)

func _on_pizarra_area_entered(area):
	if pergamino<15:
		QuestionsAula()
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		pergamino+=1
	else:
		perdio=true
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
		await get_tree().create_timer(5).timeout
		$playerlink/Camera2D/ParaPreguntasAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_estante_area_entered(area):
	if pergamino<15:
		QuestionsAula()
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		pergamino+=1
	else:
		perdio=true
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
		await get_tree().create_timer(5).timeout
		$playerlink/Camera2D/ParaPreguntasAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_estante_2_area_entered(area):
	if pergamino<15:
		QuestionsAula()
		$playerlink/Camera2D/ParaPreguntasAula.show()
		pergamino+=1
	else:
		perdio=true
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
		await get_tree().create_timer(5).timeout
		$playerlink/Camera2D/ParaPreguntasAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_estante_3_area_entered(area):
	if pergamino<15:
		QuestionsAula()
		$playerlink/Camera2D/ParaPreguntasAula.show()
		pergamino+=1
	else:
		perdio=true
		$playerlink/Camera2D/ParaPreguntasAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
		await get_tree().create_timer(5).timeout
		$playerlink/Camera2D/ParaPreguntasAula.hide()
		$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
		$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
		$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_area_entered(area):
	print("viendo")
	$playerlink/Camera2D/ParaPreguntasAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.hide()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.hide()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.hide()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.hide()
	await get_tree().create_timer(5).timeout
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/AnimatedSprite2D.show()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_2_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_3_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_4_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_5_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_6_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_7_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_8_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_9_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_10_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_11_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_12_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_13_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_14_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_15_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_16_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_17_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_obj_libro_18_area_exited(area):
	$playerlink/Camera2D/ParaPreguntasAula.hide()
	$playerlink/Camera2D/ParaPreguntasAula/PreguntaAula.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaA.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaB.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaC.show()
	$playerlink/Camera2D/ParaPreguntasAula/RespuestaD.show()


func _on_cerrar_aula_finish_area_entered(area):
	print(termino)
	if termino==true:
		$HechoPorKenny/BoxContainer/CerrarEntrada/CollisionShape2D.position= Vector2(246,998)


func _on_salio_a_aula_area_entered(area):
	if termino==true || cerro1==true:
		$playerlink/Camera2D/CanvasLayer.hide()
		$HechoPorKenny/BoxContainer/CerrarEntrada/CollisionShape2D.position= Vector2(246,998)
