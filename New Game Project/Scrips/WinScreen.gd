extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
				get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="castillo"
				get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
				get_tree().get_nodes_in_group("MiniGameCastillo")[0].queue_free()
				print("Saliedo")
