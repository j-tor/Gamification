extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_entradas_area_entered(area):
	$playerlink.position=Vector2(121,1071)
	


func _on_entrada_a_pasillo_area_entered(area):
	$playerlink.position=Vector2(114,52)

func _on_salidas_a_lobby_area_entered(area):
	$playerlink.position=Vector2(105,444)


func _on_salida_a_pasillo_area_entered(area):
	$playerlink.position=Vector2(103,103)


func _on_salida_del_lab_area_entered(area):
	$playerlink.position=Vector2(126,1008)


func _on_entrada_a_lab_area_entered(area):
	$playerlink.position=Vector2(1134,924)
