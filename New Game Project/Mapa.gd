extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	if Main.Vida_base>=80:
		$PointLight2D3/Bruja.show()
	else:
		$PointLight2D3/Bruja.hide()
	pass # Replace with function body.
	
	if !Main.bando=="":
		$PointLight2D/Sprite2D.show()
	else:
		$PointLight2D/Sprite2D.hide()
		
	if Main.GanoCombat==true:
		$PointLight2D4/Sprite2D.show()
	else:
		$PointLight2D4/Sprite2D.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
