extends AnimatableBody2D
var maquina = false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if maquina==true:
		if Input.is_action_just_pressed("interact"):
			$Expendedora.frame=0


func _on_maquina_2_area_entered(area):
	maquina = true
	$Expendedora.frame=1
	


func _on_maquina_2_area_exited(area):
	$Expendedora.frame=2
