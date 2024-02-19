extends Node2D
var Speed= 10;
var ObjetoReply = preload("res://Scene/Players-NPC/reply_obj.tscn")

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
	#if $Timer.wait_time >.5:
		#$Timer.wait_time -=.01
	#var coleccionable = ObjetoReply.instantiate()
	#coleccionable.Speed = Speed
	#coleccionable.show()
	#add_child(coleccionable)
func _NuevoDisparo():
	var coleccionable = ObjetoReply.instantiate()
	coleccionable.Speed = Speed
	coleccionable.show()
	add_child(coleccionable)
