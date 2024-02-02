extends Node2D

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
		rotacion.rotation_degrees+=velocidad
	else:
		girar=false
	pass


func _on_bt_iniciar_pressed():
	velocidad=randf_range(10,15)
	girar=true
	timer.start()

func _on_timer_timeout():
	velocidad-=5


func _on_area_2d_area_entered(area):
	print("Rojo")
	pass # Replace with function body.


func _on_area_2d_2_area_entered(area):
	print("Verde")
	pass # Replace with function body.


func _on_area_2d_3_area_entered(area):
	print("Amarillo")
	pass # Replace with function body.


func _on_area_2d_4_area_entered(area):
	print("Azul")
	pass # Replace with function body.
