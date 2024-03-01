extends CharacterBody2D

var hablo=false
var malo=false

func _ready():
	$AnimatedSprite2D.play()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if malo == true:
			hablo=true

func _on_caballo_body_entered(body):
	if body.has_method("play"):
		if Main.Recistencia<10 && hablo==true:
			Main.Recistencia+=20
	


func _on_vendedora_body_exited(body):
	if body.has_method("play"):
		print(hablo)
		print(Main.Recistencia)
		print("datos")
		


func _on_vendedora_body_entered(body):
	if body.has_method("play"):
		malo=true
		print(malo)


func _on_vendedora_area_entered(area):
	malo=true
	print(malo)
	


func _on_caballo_area_entered(area):
	if Main.Recistencia<10 && hablo==true:
			Main.Recistencia+=20


func _on_vendedora_area_exited(area):
		print(hablo)
		print(Main.Recistencia)
		print("datos")
