extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	if Main.Vida_base>=80:
		$Bruja.show()
	else:
		$Bruja.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
