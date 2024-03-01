extends Area2D

var Speed=10
var player=false
var enemy=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy==true:
		position.x-=Speed
	elif player==true:
		position.x+=Speed
