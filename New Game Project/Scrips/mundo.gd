extends Node2D

func _ready():
	pass


func _process(delta):
	pass

func _on_portal_1_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "castillo"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo")[0].queue_free()


func _on_royal_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "royal"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo")[0].queue_free()



func _on_element_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "element"
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("mundo")[0].queue_free()
 
