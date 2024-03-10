extends Node2D
var num
var RespuestaCorrectaAula
var RespuestaUserAula
var fallo=0
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
		$Control/Preguntas.text="Son los pasos o razones de la duda metódica:"
		$Control/ResA.text="Los sentidos nos engañan"
		$Control/ResB.text="la existencia del genio maligno"
		$Control/ResC.text="imposibilidad para diferenciar \nla vigilia del sueño"
		$Control/ResD.text="Todas son correctas"
		RespuestaCorrectaAula="Todas son correctas"
	elif num==1:
		$Control/Preguntas.text="Una de las siguientes es considerada de las cuatro reglas del método en Descartes:"
		$Control/ResA.text="Hipótesis"
		$Control/ResB.text="Deducción"
		$Control/ResC.text="Evidencia"
		$Control/ResD.text="Inducción"
		RespuestaCorrectaAula="Evidencia"
	elif num==2:
		$Control/Preguntas.text="En relación con los datos experimentales que otorgan los sentidos en el conocimiento, \nDescartes define como:"
		$Control/ResA.text="Los sentidos son una fuente \nconfiable para conocer\n nos proporcionan."
		$Control/ResB.text="Desconfianza de lo que \nlos sentidos nos proporcionan"
		$Control/ResC.text="Los sentidos son complementarios"
		$Control/ResD.text="Los sentidos son determinantes"
		RespuestaCorrectaAula="Desconfianza de lo que los sentidos nos proporcionan"
	elif num==3:
		$Control/Preguntas.text="Solo debemos aceptar como verdadero aquel conocimiento que sea EVIDENTE, CLARO Y DISTINTO:"
		$Control/ResA.text="René Descartes"
		$Control/ResB.text="David Hume"
		$Control/ResC.text="George Berkeley"
		$Control/ResD.text="Aristóteles"
		RespuestaCorrectaAula="René Descartes"
	if num==4:
		$Control/Preguntas.text="En cuanto a la certeza del conocimiento, René Descartes afirma lo siguiente:"
		$Control/ResA.text="Es preciso dudar"
		$Control/ResB.text="Debemos confiar ciegamente"
		$Control/ResC.text="Nada es importante"
		$Control/ResD.text="Todo es posible"
		RespuestaCorrectaAula="Es preciso dudar"
		
		
func respuesta():
	print(fallo)
	if RespuestaCorrectaAula==RespuestaUserAula:
		$Control/ProgressBar.value += 25 * 100/ 100
		QuestionsLab()
		if $Control/ProgressBar.value >= 100 && fallo<4:
					$CanvasModulate2/Label.text="                 Ganaste!!"
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
	


func _on_regresar_pressed():
	$Control/ProgressBar.value=0
	$Regresar.hide()
	$CanvasModulate2.hide()
	$".".hide()
	Main.lab+=1


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
