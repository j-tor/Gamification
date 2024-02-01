extends CharacterBody2D

var speed =280

@onready var animations = $AnimationPlayer
var mover = true
var objeto = false

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed
	if mover == true:
		if objeto == true:
			if Input.is_action_just_pressed("tecla_f"):
				mover = false
	
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
	get_input()
	move_and_collide(velocity * delta)
	updateAnimation()
	


func _on_regreso_area_entered(area):
	if area.is_in_group("player"):
		get_tree().get_nodes_in_group("Game")[0].siguiente_nivel="mundo1"
		get_tree().get_nodes_in_group("Game")[0].ubicacion = Vector2(86,-938)
		get_tree().get_nodes_in_group("Game")[0]._verificar_nivel()
		get_tree().get_nodes_in_group("casa")[0].queue_free()


func _on_detec_obj_area_entered(area):
	if area.is_in_grup("objeto"):
		objeto = true
	


func _on_detec_obj_area_exited(area):
	if area.is_in_grup("objeto"):
		objeto = false
