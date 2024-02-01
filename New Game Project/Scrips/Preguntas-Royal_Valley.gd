extends Node2D

var pregunta_numero
var respuesta
var damage = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	preguntar()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

func preguntar():
	$Node2D.update_progressbar()
	$cursor_A.visible = false
	$cursor_B.visible = false
	$cursor_C.visible = false
	pregunta_numero = randi() % 3
	print(respuesta)
	if pregunta_numero == 0:
		print("De que color son los tomates")
		$Pregunta.text = "De que color son los tomates"
		$r_a.text = "rojo"
		$r_b.text = " azul"
		$r_c.text = "verde"
	
	if pregunta_numero == 1:
		print("De que color son las frambuesas")
		$Pregunta.text = "De que color son las frambuesas"
		$r_a.text = "rojo"
		$r_b.text = "azul"
		$r_c.text = "verde"
	
	if pregunta_numero == 2:
		print("De que color son los limones")
		$Pregunta.text = "De que color son los limones"
		$r_a.text = "rojo"
		$r_b.text = "azul"
		$r_c.text = "verde"

func responder():
	if pregunta_numero == 0:
		if respuesta == 1:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
		elif respuesta == 2:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif  respuesta == 3:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage

	if pregunta_numero == 1:
		if respuesta == 1:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif respuesta == 2:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
		elif  respuesta == 3:
			$Node2D.vida -= damage
			$Resultado.text = "incorecto"
			
	if pregunta_numero == 2:
		if respuesta == 1:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif respuesta == 2:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif  respuesta == 3:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
			

func _on_r_a_pressed():
	$Node2D._animacion_ataque()
	respuesta = 1
	responder()
	preguntar()
	$cursor_A.visible = true


func _on_r_b_pressed():
	$Node2D._animacion_ataque()
	respuesta = 2
	responder()
	preguntar()
	$cursor_B.visible = true

func _on_r_c_pressed():
	$Node2D._animacion_ataque()
	respuesta = 3
	responder()
	preguntar()
	$cursor_C.visible = true
	

func _on_r_c_button_up():
	$cursor_C.visible = false


func _on_r_b_button_up():
	$cursor_B.visible = false


func _on_r_a_button_up():
	$cursor_A.visible = false


func _on_r_c_focus_entered():
	$cursor_C.visible = true


func _on_r_b_focus_entered():
	$cursor_B.visible = true


func _on_r_a_focus_entered():
	$cursor_A.visible = true
	
