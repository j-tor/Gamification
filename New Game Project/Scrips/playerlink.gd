extends CharacterBody2D

var speed =280

@onready var animations = $AnimationPlayer
var mover = true
var objeto = false
var ruleta = false

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed
	
				
	
func updateAnimation():
	
	var direction = "Walk"
	if velocity.x < 0 : 
		direction = "Left" 
		$Detec_obj/CollisionShape2D.rotation_degrees =90
	elif velocity.x > 0 : 
		direction = "Right"
		$Detec_obj/CollisionShape2D.rotation_degrees =270
	elif velocity.y < 0 : 
		direction = "Up"
		$Detec_obj/CollisionShape2D.rotation_degrees =180
	elif velocity.y > 0 : 
		direction = "Down"
		$Detec_obj/CollisionShape2D.rotation_degrees =0
	else:animations.stop()

	animations.play("run"+direction)
	
	
	

func _physics_process(delta):
	if mover == true:
		if objeto == true:
			if Input.is_action_just_pressed("ui_accept"):
				$Macro.visible = true
				Main._dialogo()
				$Macro/Control.ingresar_dialogo()
				mover = false
				print(" Reproducir Dialogo")
		if ruleta == true:
			
			if Input.is_action_just_pressed("interact"):
					$"../Entrada a ruleta/Ruelta"._reproducir()
					print("Rueleta corriendo ")
			if  Input.is_action_just_pressed("ui_cancel"):
						$Macro.visible = true
						Main._game()
						Main._dialogo()
						$Macro/Control.ingresar_dialogo()
						print("Rueleta Stop 3")
				
	get_input()
	move_and_collide(velocity * delta)
	updateAnimation()
	
func dialogodezona():
	$Macro.visible = true
	Main._dialogo()
	$Macro/Control.ingresar_dialogo()
	mover = false
	print(" Reproducir Dialogo")
	

func _on_regreso_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("Game")[0].siguiente_nivel="mundo1"
		get_tree().get_nodes_in_group("Game")[0].ubicacion = Vector2(86,-938)
		get_tree().get_nodes_in_group("Game")[0]._verificar_nivel()
		get_tree().get_nodes_in_group("casa")[0].queue_free()


func _on_detec_obj_area_entered(area):
	$Macro/Control/Label.text = str(area.name)
	if area.is_in_group("objeto"):
		Main.nombre_objeto = area.name
		objeto = true
		print("adentro ",area.name)
		
	if area.is_in_group("Ruleta"):
		Main.nombre_objeto = area.name
		ruleta = true
		print("adentro ",area.name)
	
	

func _on_detec_obj_area_exited(area):
	if area.is_in_group("objeto"):
		objeto = false
		print("afuera")


func _on_area_2d_2_area_entered(area):
	if area.is_in_group("objeto"):
		objeto = false
		print("afuera")
		
