extends Node2D

var Objetos_minijuego_forest = preload("res://Scene/objetos_minijuego_forest.tscn")

var dificultad=0

func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2,4)
	$Timer.start()

func _on_timer_timeout():
	dificultad+= 0.1
	if $Timer.wait_time >.5:
		$Timer.wait_time -=.01
	var coleccionable = Objetos_minijuego_forest.instantiate()
	coleccionable.Speed += dificultad
	#coleccionable.global_position = global_position
	add_child(coleccionable)
	
