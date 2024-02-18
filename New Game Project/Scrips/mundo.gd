extends Node2D

func _ready():
	$playerlink.position = get_tree().get_nodes_in_group("GAME")[0].ubicacion
	statues()

func _process(delta):
	pass

func statues():
	if Main.GreeGame==false||Main.pinkGame==false||Main.BlueGame==false||Main.yellowGame==false:
		pass#$"Elemental Santuary/Sprite2D".hide()
		#$Royal/Sprite2D.hide()
		#$Element/Sprite2D.hide()
		#$"Ice zone/Sprite2D".hide()
	elif (Main.yellowGame==true):
		$"Elemental Santuary/Sprite2D".show()
	elif (Main.BlueGame==true):
		$"Ice zone/Sprite2D".show()
	elif (Main.pinkGame==true):
		$Element/Sprite2D.show()
	elif (Main.GreeGame==true):
		$Royal/Sprite2D.show()	

func _on_portal_1_area_entered(area):
	if area.is_in_group("player"):
		if Main.yellowGame==true:
			$"Element/Salida hacia Element".show()
			$"Elemental Santuary/Sprite2D".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "castillo"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
		else :
			$"Element/Salida hacia Element".hide()
			


func _on_royal_area_entered(area):
	if area.is_in_group("player"):
		if Main.GreeGame==true:
			$"Royal/Entrada a Royal".show()
			$Royal/Sprite2D.show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "royal"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
		else :
			$"Royal/Entrada a Royal".hide()
		



func _on_element_area_entered(area):
	if area.is_in_group("player"):
		if Main.pinkGame==true:
			$"Elemental Santuary/Entrada a Satuary".show()
			$Element/Sprite2D.show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "element"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
		else :
			$"Elemental Santuary/Entrada a Satuary".hide()
			



func _on_entrada_a_ruleta_area_entered(area):
		if area.is_in_group("Ruleta"):
			
			print(" entreo")
				
	



func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		if Main.BlueGame==true:
			$"Ice zone/Entrada a Ice zone".show()
			$"Ice zone/Sprite2D".show()
			get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "Icezone"
			get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
			get_tree().get_nodes_in_group("mundo")[0].queue_free()
		else :
			$"Ice zone/Entrada a Ice zone".hide()
			
