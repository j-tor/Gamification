extends CharacterBody2D

var speed =280+Main.Velocidad
@onready var animations = $AnimationPlayer
var mover = true
var objeto = false
var ruleta = false
var bando = false
var bruja = false

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1


	velocity = velocity.normalized() * speed	
	
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
		
		if objeto == true :
			if Input.is_action_just_pressed("ui_accept"):
				$Macro.visible = true
				Main._dialogo()
				$Macro/Control.ingresar_dialogo()
				print(" Reproducir Dialogo")
				#if bruja == true:
					#Main.bando="Racionalista"
				if Main.bruja ==true:
					bruja = true
				if Main.seleccionado==true:
					Main.color = true
			
		if Input.is_action_just_pressed("Map"):
			if $"Camera2D2/Game Map".visible==false:
				$"Camera2D2/Game Map".show()
			else:
				$"Camera2D2/Game Map".hide() 
			
		if  Input.is_action_just_pressed("Close_Map"):
				$"Camera2D2/Game Map".hide()
				
		if Input.is_action_just_pressed("ui_text_indent"):
			if $CanvasLayer.visible==false:
				$CanvasLayer.show()
			else:
				$CanvasLayer/MoreSomethings.ocultarTodo()
				$CanvasLayer.hide()
			

				
				
		if ruleta == true:
				if Input.is_action_just_pressed("interact"):
						if ruleta == true:
							$"Camera2D2/Game Map".hide()
							$"../Entrada a ruleta/Ruelta"._reproducir()
							print("Rueleta corriendo ")
							$"../Entrada a ruleta/Node2D".playing()
							$"../Entrada a ruleta/Node2D".visible=true
							
							Main.rulet=false
							print(Main.rulet)
						else:
							print(Main.rulet+"nada")
				if  Input.is_action_just_pressed("ui_cancel"):
							#$Macro.visible = true
							#Main._game()
							#Main._dialogo()	
							$"Camera2D2/Game Map".hide()
							$"../Entrada a ruleta/Node2D".hide()
							

							if Main.rulet==true:
								
								Main.rulet=false
								print(Main.rulet)
							#$Macro/Control.ingresar_dialogo()
							print("Rueleta Stop 3")
				
	get_input()
	move_and_collide(velocity * delta)
	updateAnimation()
	print(Main.Data)
	
func dialogodezona():
	$Macro.visible = true
	Main._dialogo()
	$Macro/Control.ingresar_dialogo()
	mover = false
	print(" Reproducir Dialogo")
	

func _on_regreso_area_entered(area):
	print(Main.Vida_base)
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
		print("Adentro ",area.name)
		
	if area.is_in_group("Bruja"):
		objeto = true
		bando = true
		bruja=true
		Main.nombre_objeto = area.name
		print("Adentro ",area.name)
		
		
	if area.is_in_group("Ruleta"):
		Main.nombre_objeto = area.name
		ruleta = true
		print("Adentro ",area.name)
		
	if area.is_in_group("Empirista"):
		objeto =true
		Main.nombre_objeto = area.name
		if bruja ==true :
			Main.bando="Empirista"
		print(Main.bando)
		
		print("Adentro ",area.name)
		
	if area.is_in_group("Racionalista"):
		objeto = true
		Main.nombre_objeto = area.name
		if bruja ==true:
			Main.bando="Racionalista"
		print(Main.bando)
		print("Adentro ",area.name)
	if area.is_in_group("item"):
		
		
		print(area.item_id)
		area.queue_free()
		
	 
	print("Adentro ",area.name)
	

func _on_detec_obj_area_exited(area):
	if area.is_in_group("objeto"):
		objeto = false
		print("Afuera")
	if area.is_in_group("Ruleta"):
		ruleta = false
		print("Afuera ruleta")
		
	if area.is_in_group("Empirista"):
		objeto = false
		Main.nombre_objeto = area.name
		print("Afuera ",area.name)
		
	if area.is_in_group("Racionalista"):
		objeto = false
		Main.nombre_objeto = area.name
		print("Afuera ",area.name)
		
	if area.is_in_group("Bruja"):
		objeto = true
		bando=true
		Main.nombre_objeto = area.name
		print("Afuera ",area.name)
		print(bando)
		
		


func _on_area_2d_2_area_entered(area):
	if area.is_in_groupx("objeto"):
		objeto = false
		print("afuera")
	if area.is_in_group("Ruleta"):
		ruleta = false
		print("afuera ruleta")
		
	if area.is_in_group("Empirista"):
		print("afuera")
	if area.is_in_group("Racionalista"):
		print("afuera")
		
