extends Node2D

func _ready():
	pass
func _process(delta):
	pass

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="mundo1"
		get_tree().get_nodes_in_group("GAME")[0].ubicacion = Vector2(82,-944)
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("castillo")[0].queue_free()
