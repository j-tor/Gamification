extends Node2D

var pregunta_numero
var respuesta
var damage = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	preguntar()
	$Node2D.position=Vector2(536,316)
	$r_a/AnimatedSprite2D.play("idle")
	$r_b/AnimatedSprite2D.play("idle")
	$r_c/AnimatedSprite2D.play("idle")
	if $Node2D.position==Vector2(536,316):
		#$r_a/AnimatedSprite2D.stop("damage")
		$r_a/AnimatedSprite2D.play("idle")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

func preguntar():
	if $Node2D2/ProgressBar.value >= 100:
				print("Barra llena")
				# de aqui a:
				get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="castillo"
				get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
				get_tree().get_nodes_in_group("MiniGameCastillo")[0].queue_free()
				# hasta aqui son lo que debes poner para que te mande al otro lado 
	$r_a/AnimatedSprite2D.play("idle")
	$r_b/AnimatedSprite2D.play("idle")
	$r_c/AnimatedSprite2D.play("idle")
	$Node2D.update_progressbar()
	$cursor_A.visible = false
	$cursor_B.visible = false
	$cursor_C.visible = false
	$Node2D.position=Vector2(536,316)
	pregunta_numero = randi() % 5
	print(respuesta)
	if pregunta_numero == 0:
		print("Pregunta 1")
		$Pregunta.text = " Entre lossiguientes renacentistas seleccione, uno de los precursores filósofo-científico del heliocentrismo
(teoría que afirma que el sol es el centro del universo): 
	A) Tomas Moro. B) Galileo. C) Platón."

		$r_a.text = "A"
		$r_b.text = "B"
		$r_c.text = "C"
	
	if pregunta_numero == 1:
		print("Pregunta 2")
		$Pregunta.text = "El método científico se introduce por el interés de tres filósofos. Entre los siguientes uno de los 
mencionados no es precursor del método científico:
	A) Francis Bacon. B) Galileo Galilei. C)Nicolas Maquiavelo."
		$r_a.text = "A"
		$r_b.text = "B"
		$r_c.text = "C"
	
	
	if pregunta_numero == 2:
		print("Pregunta 3")
		$Pregunta.text = "Es uno de los precursores del pensamiento Moderno: 
		A) Isaac Newton. B) René Descartes. C) Erasmo de Roterdam."
		$r_a.text = "A"
		$r_b.text = "B"
		$r_c.text = "C"
		
	if pregunta_numero == 3:
		print("Pregunta 4")
		$Pregunta.text = "De los siguientes filósofos niega el geocentrismo (teoría que afirma que el centro de nuestro sistema solar 
es la tierra):
	A) Aristóteles. B) Nicolás Copérnico. C) Tomás de Aquino."
		$r_a.text = "A"
		$r_b.text = "B"
		$r_c.text = "C"
		
	if pregunta_numero == 4:
		print("Pregunta 4")
		$Pregunta.text = "Uno de los inventos que suscitó un conocimiento ilimitado, fue el de Gutenberg:
			A) El astrolabio. B) La imprenta. C) La Nao y la Carabela."
		$r_a.text = "A"
		$r_b.text = "B"
		$r_c.text = "C"	

func responder():
	if $Node2D.position==Vector2(536,316):
		$r_a/AnimatedSprite2D.play("idle")
	
		
	if pregunta_numero == 0:
		if respuesta == 1:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif respuesta == 2:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
		elif  respuesta == 3:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage

	if pregunta_numero == 1:
		if respuesta == 1:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif respuesta == 2:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif  respuesta == 3:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
			
			
	if pregunta_numero == 2:
		if respuesta == 1:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif respuesta == 2:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
		elif  respuesta == 3:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
			
	if pregunta_numero == 3:
		if respuesta == 1:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif respuesta == 2:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
		elif  respuesta == 3:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
			
	if pregunta_numero == 4:
		if respuesta == 1:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage
		elif respuesta == 2:
			$Resultado.text = "Correcto"
			$Node2D2/ProgressBar.value += 1 * 100/ 6 
		elif  respuesta == 3:
			$Resultado.text = "incorecto"
			$Node2D.vida -= damage

func _on_r_a_pressed():
	$Node2D._animacion_ataque()
	respuesta = 1
	responder()
	preguntar()
	$cursor_A.visible = true
	$Node2D.position=Vector2(313.415,288.276)
	$r_a/Skull._damage()
	




func _on_r_b_pressed():
	$Node2D._animacion_ataque()
	respuesta = 2
	responder()
	preguntar()
	$cursor_B.visible = true
	$Node2D.position=Vector2(536,316)
	$r_b/Skull._damage()

func _on_r_c_pressed():
	$Node2D._animacion_ataque()
	respuesta = 3
	responder()
	preguntar()
	$cursor_C.visible = true
	$Node2D.position=Vector2(536,316)
	$r_c/Skull._damage()
	

func _on_r_c_button_up():
	$cursor_C.visible = false
	$Node2D.position=Vector2(536,316)


func _on_r_b_button_up():
	$cursor_B.visible = false
	$Node2D.position=Vector2(536,316)


func _on_r_a_button_up():
	$cursor_A.visible = false
	$Node2D.position=Vector2(536,316)
	

func _on_r_c_focus_entered():
	$cursor_C.visible = true
	$Node2D.position=Vector2(240.244,393.103)



func _on_r_b_focus_entered():
	$cursor_B.visible = true
	$Node2D.position=Vector2(193.902,328.966)

func _on_r_a_focus_entered():
	$cursor_A.visible = true
	$Node2D.position=Vector2(313.415,288.276)


func _on_damage_animation_finished():
	$r_a/AnimatedSprite2D.play("idle")
	

