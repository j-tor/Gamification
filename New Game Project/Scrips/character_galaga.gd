extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	var inputVel = Input.get_axis("ui_left","ui_right")
	var apresteSalto = Input.get_action_raw_strength("ui_accept") 
	##var Disparo = Input.get_("Click_Derecho")
	
	
	velocity.x= inputVel * SPEED
	
	if apresteSalto !=0 and is_on_floor():
		velocity.y =0
		velocity.y -= apresteSalto * 600
		
	if !is_on_floor():
		velocity.y +=20
	move_and_slide()
	
	if Input.is_action_just_pressed("Click_Derecho"):
		print("Apreto?")
		$AnimatedSprite2D.play("Lanzar")
		$SpawnerReplyGeneretor._NuevoDisparo()
	#else:
	#	$AnimatedSprite2D.play("Normal")
		#$AnimatedSprite2D.play("Normal")
		#$"."._NuevoDisparo()
		#$".".position = $"." .position
		#$"../SpawnerReply"._NuevoDisparo()
		#$"../SpawnerReply".position =$".".position
	#if velocity.x !=0: 
		#animated_sprite_2d.play("run")
	#else: 
		#animated_sprite_2d.play("idle")
	#if inputVel!= 0:
		#animated_sprite_2d.flip_h = inputVel < 0
		
####3
