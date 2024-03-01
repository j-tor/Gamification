extends Node2D
var Speed= 10;
var ObjetoReply = preload("res://Scene/flecha_game_war.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2,4)
	$Timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	pass
func _NuevoDisparo():
	var coleccionable = ObjetoReply.instantiate()
	coleccionable.Speed = Speed
	coleccionable.show()
	add_child(coleccionable)
