extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if $Area2D3/CollisionShape2D.rotation==90:
		$Area2D3/CollisionShape2D.rotation+=90
	else:
		$Area2D3/CollisionShape2D.rotation+=180
	pass # Replace with function body.


func _on_button_2_pressed():
	pass # Replace with function body.


func _on_button_3_pressed():
	pass # Replace with function body.
