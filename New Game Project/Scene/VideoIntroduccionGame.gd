extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	pass
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="mundo1"
	get_tree().get_nodes_in_group("GAME")[0].ubicacion = Vector2(193,1530)
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("VideoIntro")[0].queue_free()
