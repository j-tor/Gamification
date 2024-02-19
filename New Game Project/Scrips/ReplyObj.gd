extends Area2D

var Speed= 0.0001

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	position.y -=Speed


func _on_body_entered(body):
	pass
	if body.is_in_group("Pregunta1"):
		print("Entro")
	#	
