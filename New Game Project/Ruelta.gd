extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("Ruleta")
	if Input.is_action_just_pressed("ui_cancel"):
		$AnimationPlayer.stop()
		
