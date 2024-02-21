extends Node2D

func _ready():
	#$playerlink.position = get_tree().get_nodes_in_group("GAME")[0].ubicacion
	_statues()

func _process(delta):
	
	_statues()
	pass

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
	if area.is_in_group("player"):
		if Main.yellowGame==true:
			$"Element/Salida hacia Element".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "castillo"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
		else :
			$"Element/Salida hacia Element".hide()
			


func _on_royal_area_entered(area):
	if area.is_in_group("player"):
		if Main.GreeGame==true:
			$"Royal/Entrada a Royal".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "royal"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
		else :
			$"Royal/Entrada a Royal".hide()
		



func _on_element_area_entered(area):
	if area.is_in_group("player"):
		if Main.pinkGame==true:
			$"Elemental Santuary/Entrada a Satuary".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "element"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
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
		if Main.BlueGame==true:
			$"Ice zone/Entrada a Ice zone".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "Icezone"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
		else :
			$"Ice zone/Entrada a Ice zone".hide()
			
