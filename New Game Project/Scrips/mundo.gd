extends Node2D
var showposima
func _ready():
	if Main.bando=="Empirista":
		$playerlink/Camera2D2/Empirista.show()
	elif Main.bando=="Racionalista":
		$playerlink/Camera2D2/Racionalista.show()
	else:
		$playerlink/Camera2D2/Empirista.hide()
		$playerlink/Camera2D2/Racionalista.hide()
	if Main.Velocidad >= 20:
		$playerlink/Camera2D2/Velocidad_aumentada.play()
		$playerlink/Camera2D2/Velocidad_aumentada.show()
	else:
		$playerlink/Camera2D2/Velocidad_aumentada.hide()
	
	if Main.Recistencia>=10:
		$playerlink/Camera2D2/Leche.show()
	else:
		$playerlink/Camera2D2/Leche.hide()
	
	if Main.Vida_base >= 19 && Main.Vida_base < 40 :
		$playerlink/Camera2D2/Heart1.frame=0
	elif Main.Vida_base >= 40 && Main.Vida_base < 60:
		$playerlink/Camera2D2/Heart1.frame=0
		$playerlink/Camera2D2/Heart2.frame=0
	elif Main.Vida_base >= 60 && Main.Vida_base < 80:
		$playerlink/Camera2D2/Heart1.frame=0
		$playerlink/Camera2D2/Heart2.frame=0
		$playerlink/Camera2D2/Heart3.frame=0
	elif Main.Vida_base >= 80:
		$playerlink/Camera2D2/Heart1.frame=0
		$playerlink/Camera2D2/Heart2.frame=0
		$playerlink/Camera2D2/Heart3.frame=0
		$playerlink/Camera2D2/Heart4.frame=0
		$Princesa.show()
	else:
		print("nose")
	#$playerlink.position = get_tree().get_nodes_in_group("GAME")[0].ubicacion
	_statues()
	showposima= Main.posimaAulaReco
	if showposima==true:
		$playerlink/Camera2D2/PosimaAula.show()

func _process(delta):
	if Main.Recistencia>=10:
		$playerlink/Camera2D2/Leche.show()
	else:
		$playerlink/Camera2D2/Leche.hide()
	
	if Main.Velocidad >= 20:
		$playerlink/Camera2D2/Velocidad_aumentada.play()
		$playerlink/Camera2D2/Velocidad_aumentada.show()
	else:
		$playerlink/Camera2D2/Velocidad_aumentada.hide()
	_statues()
	#print($playerlink.position)
	if Main.VieneRuleta==true:
		$playerlink.position=Vector2(39.33334,583)
		Main.VieneRuleta=false
	elif Main.VineBruja==true:
		$playerlink.position=Vector2(103.6361,-220.4839)
		Main.VineBruja=false
	elif Main.vieneUni==true:
		$playerlink.position=Vector2(231.3764,1027.212)
		Main.vieneUni=false
	elif Main.vieneGameWar==true:
		$playerlink.position=Vector2(101.5747,-946.8241)
		Main.vieneGameWar=false

func _statues():
	if Main.GreeGame==false||Main.pinkGame==false||Main.BlueGame==false||Main.yellowGame==false:
		$"Entrada a ruleta/Castle".hide()
		$"Entrada a ruleta/Element".hide()
		$"Entrada a ruleta/Ice".hide()
		$"Entrada a ruleta/Royal".hide()
	if (Main.yellowGame==true):
		$"Entrada a ruleta/Castle".show()
	if (Main.BlueGame==true):
		$"Entrada a ruleta/Ice".show()
	if (Main.pinkGame==true):
		$"Entrada a ruleta/Element".show()
	if (Main.GreeGame==true):
		$"Entrada a ruleta/Royal".show()


func _on_portal_1_area_entered(area):
	if area.is_in_group("player") && Main.ganoElementJuegoDeJeffrey==false:
		if Main.yellowGame==true:
			Main.VieneRuleta=true
			$"Element/Salida hacia Element".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "castillo"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo1")[0].queue_free()
		else :
			$"Element/Salida hacia Element".hide()
			


func _on_royal_area_entered(area):
	if area.is_in_group("player"):
		if Main.GreeGame==true :
			Main.VieneRuleta=true
			$"Royal/Entrada a Royal".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "royal"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo1")[0].queue_free()
		else :
			$"Royal/Entrada a Royal".hide()
		



func _on_element_area_entered(area):
	if area.is_in_group("player"):
		if Main.pinkGame==true && Main.JuegoDeKennyRecolector==false:
			$"Elemental Santuary/Entrada a Satuary".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "element"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo1")[0].queue_free()
			Main.VieneRuleta=true
		else :
			
			$"Elemental Santuary/Entrada a Satuary".hide()
			



func _on_entrada_a_ruleta_area_entered(area):
		if area.is_in_group("Ruleta"):
			if Input.is_action_just_pressed("interact"):
						$"Entrada a ruleta/Node2D"._reproducir()
						print("Rueleta corriendo ")
						$"Entrada a ruleta/Node2D".playing()
			
			print(" entreo")
				
	



func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		if Main.BlueGame==true && Main.SegundoGameKennyGalaga==false :
			$"Ice zone/Entrada a Ice zone".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "Icezone"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo1")[0].queue_free()
			Main.VieneRuleta=true
		else :
			$"Ice zone/Entrada a Ice zone".hide()
			


func _on_entrada_them_ruleta_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "EleccionBando"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo1")[0].queue_free()


func _on_entrar_wicth_area_enteared(area):
	print("uis mas comida")
	if Main.Vida_base >= 80:
		print("entre")
		#Main.VineBruja=true
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "EleccionBando"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo1")[0].queue_free()
	


func _on_entrada_a_game_combat_area_entered(area):
	if area.is_in_group("player") && Main.bando!="":
		Main.vieneGameWar=true
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "WarGame"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo1")[0].queue_free()


func _on_entrada_a_university_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "Universidad"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo1")[0].queue_free()


func _on_entrada_a_aula_area_entered(area):
	if area.is_in_group("player"):
		Main.vieneUni=true
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "Universidad"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo1")[0].queue_free()


func _on_entrar_wicth_area_entered(area):
	print("uis mas comida")
	if Main.Vida_base >= 80:
		print("entre")
		Main.VineBruja=true
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "EleccionBando"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo1")[0].queue_free()
