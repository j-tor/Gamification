extends Node2D

var Objetos_minijuego_forest = preload("res://Scene/objetos_minijuego_forest.tscn")

func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2,4)
	$Timer.start()

func _on_timer_timeout():
	var coleccionable = Objetos_minijuego_forest.instantiate()
	#coleccionable.global_position = global_position
	add_child(coleccionable)
	
