extends Node2D

var coloractual=""
var primera =false
var colorescogidos=[]
var velocidad=15
var girar=false
@onready var timer=$"../Timer"
@onready var rotacion=$"."
# Called when the node enters the scene tree for the first time.
func _ready():
	print("esta abierta ")
	girar=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocidad<=0:
		girar=false
		timer.stop()
	if girar:
		if len(colorescogidos) != 4:
			rotacion.rotation_degrees+=velocidad 
			primera=true
	else:
		girar=false
		if primera:
			if !colorescogidos.has(coloractual):
				print("color escogido")
				colorescogidos.append(coloractual)
				print(colorescogidos)
				primera=false
			else:
				velocidad=randf_range(10,15)
				rotacion.rotation_degrees+=velocidad 
				timer.start()
	pass


func _on_bt_iniciar_pressed():
	velocidad=randf_range(10,15)
	girar=true
	timer.start()

func _on_timer_timeout():
	velocidad-=5


func _on_area_2d_area_entered(area):
	print("Rojo")
	coloractual="Rojo"
	pass # Replace with function body.


func _on_area_2d_2_area_entered(area):
	print("Verde")
	coloractual="Verde"
	pass # Replace with function body.


func _on_area_2d_3_area_entered(area):
	print("Amarillo")
	coloractual="Amarillo"
	pass # Replace with function body.


func _on_area_2d_4_area_entered(area):
	print("Azul")
	coloractual="Azul"
	pass # Replace with function body.
