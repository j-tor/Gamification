extends CharacterBody2D

var hablo=false
var malo=false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if malo == true:
			hablo=true

func _on_caballo_body_entered(body):
	if Main.Recistencia<=10 && hablo==true:
		Main.Recistencia+=20
	


func _on_vendedora_body_exited(body):
	pass


func _on_vendedora_body_entered(body):
	malo=true
