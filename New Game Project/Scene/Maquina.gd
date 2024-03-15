extends AnimatableBody2D
var maquina = false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if maquina==true:
		if Input.is_action_just_pressed("ui_accept"):
			pass
		if Input.is_action_just_pressed("interact"):
			$Expendedora.frame=0
			$"../playerlink/Camera2D/eggdata".hide()
			$"../playerlink/Camera2D/Eggcluster".hide()
			$"../playerlink/Camera2D/eggvolution".hide()
			$"../playerlink/Camera2D/Tesla".hide()
			$".".hide()
			$"../Control".hide()
			$"../playerlink/Camera2D/Tesla".show()


func _on_maquina_2_area_entered(area):
	

	maquina = true
	$Expendedora.frame=1
	


func _on_maquina_2_area_exited(area):
	maquina = false
	$Expendedora.frame=2
	$".".show()
	$"../Control".show()
	$"../playerlink/Camera2D/Tesla".hide()
