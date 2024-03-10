extends Node2D

var num
var fallo=0
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
	num =randi()%5
	if num==0:
		$Control/Preguntas.text="Son los pasos o razones de la duda metódica:\n 
		A) Los sentidos nos engañan, B) la existencia del genio maligno, \nC) imposibilidad para diferenciar la vigilia del sueño. D) Todas son correctas "
		RespuestaCorrectaAula="Todas son correctas"
	elif num==1:
		$Control/Preguntas.text="Una de las siguientes es considerada de las cuatro reglas del método en Descartes:\n
		A) Hipótesis. B) Deducción. C) Evidencia. D) Inducción."
		RespuestaCorrectaAula="Evidencia"
	elif num==2:
		$Control/Preguntas.text="En relación con los datos experimentales que otorgan los sentidos en el conocimiento, \nDescartes define como:\n
		A) Los sentidos son una fuente confiable para conocer. B) Desconfianza de lo que los sentidos 
		nos proporcionan. C) Los sentidos son complementarios. D) Los sentidos son determinantes"
		RespuestaCorrectaAula="Desconfianza de lo que los sentidos nos proporcionan"
	elif num==3:
		$Control/Preguntas.text="Solo debemos aceptar como verdadero aquel conocimiento que sea EVIDENTE, CLARO Y DISTINTO:\n 
		A) René Descartes. B) David Hume. C) George Berkeley. D) Aristóteles"
		RespuestaCorrectaAula="René Descartes"
	if num==4:
		$Control/Preguntas.text="En cuanto a la certeza del conocimiento, René Descartes afirma lo siguiente:\n 
		A) Es preciso dudar. B) Debemos confiar ciegamente. C) Nada es importante. D) Todo es posible"
		RespuestaCorrectaAula="Es preciso dudar"

func respuesta():
	print(fallo)
	if RespuestaCorrectaAula==RespuestaUserAula:
		$Control/ProgressBar.value += 25 * 100/ 100
		QuestionsLab()
		if $Control/ProgressBar.value >= 100 && fallo<4:
					$CanvasModulate2/Label.text="Ganaste!!"
					$CanvasModulate2.show()
					$Regresar.show()
					print("Barra llena")
		else:
			if fallo==2:
				$CanvasModulate2.show()
				$Regresar.show()
	else:
		fallo+=1
		if fallo==4:
				$CanvasModulate2.show()
				$Regresar.show()
		QuestionsLab()
		$Control/ProgressBar.value -= 25 * 100/ 100
		print("Fallastes")
	
func _on_a_pressed():
	
	if num==0:
		RespuestaUserAula="Los sentidos nos engañan"
	elif num==1:
		RespuestaUserAula="Hipótesis"
	elif num==2:
		RespuestaUserAula="Los sentidos son una fuente confiable para conocer"
	elif num==3:
		RespuestaUserAula="René Descartes"
	elif num==4:
		RespuestaUserAula="Es preciso dudar"
	respuesta()
	
	


func _on_b_pressed():
	if num==0:
		RespuestaUserAula="la existencia del genio maligno"
	elif num==1:
		RespuestaUserAula="Deducción"
	elif num==2:
		RespuestaUserAula="Desconfianza de lo que los sentidos nos proporcionan"
	elif num==3:
		RespuestaUserAula="David Hume"
	elif num==4:
		RespuestaUserAula="Debemos confiar ciegamente"
	respuesta()


func _on_c_pressed():
	if num==0:
		RespuestaUserAula="imposibilidad para 
diferenciar la vigilia del sueño"
	elif num==1:
		RespuestaUserAula="Evidencia"
	elif num==2:
		RespuestaUserAula="Los sentidos son complementarios"
	elif num==3:
		RespuestaUserAula="George Berkeley"
	elif num==4:
		RespuestaUserAula="Nada es importante"
	respuesta()


func _on_d_pressed():
	if num==0:
		RespuestaUserAula="Todas son correctas"
	elif num==1:
		RespuestaUserAula="Inducción"
	elif num==2:
		RespuestaUserAula=" Los sentidos son determinantes"
	elif num==3:
		RespuestaUserAula="Aristóteles"
	elif num==4:
		RespuestaUserAula="Todo es posible"
	respuesta()



func _on_button_pressed():
	if $Control/NOSE.visible==false:
		$Control/NOSE.show()
	else:
		$Control/NOSE.hide()
	 # Replace with function body.


func _on_regresar_pressed():
	$CanvasModulate2.hide()
	$Regresar.hide()
	$Control/ProgressBar.value=0
	$".".hide()
	Main.lab+=1
