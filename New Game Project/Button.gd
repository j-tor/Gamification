extends Button

var change_scene = load("res://CREATEUSER.tscn")
# Called when the node enters the scene tree for the first time.


func _on_pressed()-> void :
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="crearUsuario"
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("Login")[0].queue_free()
