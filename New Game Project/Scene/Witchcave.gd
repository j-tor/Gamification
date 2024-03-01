extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_regreso_a_mundo_area_entered(area):
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="mundo1"
	get_tree().get_nodes_in_group("GAME")[0].ubicacion = Vector2(84,-124)
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("EleccionBando")[0].queue_free()


func _on_bruja_area_entered(area):
	Main.bruja = true
	print(Main.bruja)
	print(Main.bando)
	pass # Replace with function body.
