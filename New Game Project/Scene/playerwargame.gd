extends CharacterBody2D

var elecionPLayer=Main.bando
#var elecionPLayer="Racionalista"
#var elecionPLayer="Empirista"
var SPEED = 300.0
const JUMP_VELOCITY = -500.0
var countdown_timer = 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if Main.Velocidad>10:
		SPEED+=20
	if elecionPLayer=="Racionalista":
		$AnimatedSprite2D.play("normal")
	elif elecionPLayer=="Empirista":
		$AnimatedSprite2D.play("normalempi")
func _physics_process(delta):
	# Add the gravity.
	#$SpawnerFlecha._NuevoDisparo()
	if not is_on_floor():
		velocity.y += gravity * delta
		#$SpawnerFlecha._NuevoDisparo()
		print("este juan")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction>0:
			if elecionPLayer=="Racionalista":
				$AnimatedSprite2D.play("run")
			elif elecionPLayer=="Empirista":
				$AnimatedSprite2D.play("runempi")
			$AnimatedSprite2D.flip_h=false
		elif direction<0:
			$AnimatedSprite2D.flip_h =true
			if elecionPLayer=="Racionalista":
				$AnimatedSprite2D.play("run")
			elif elecionPLayer=="Empirista":
				$AnimatedSprite2D.play("runempi")
			
		
		velocity.x = direction * SPEED
		
		#print(direction)
	else:
		if direction==0:
			if elecionPLayer=="Racionalista":
				$AnimatedSprite2D.play("normal")
			elif elecionPLayer=="Empirista":
				$AnimatedSprite2D.play("normalempi")
			$AnimatedSprite2D.flip_h=false
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


func _on_area_2d_area_entered(area):
	pass
func _Questions():
	pass
func enviarataqueblanco():
	$AnimatedSprite2D.play("attack")
func enviarataqueRojo():
	$AnimatedSprite2D.play("AttackRojo")
func murio():
	$AnimatedSprite2D.play("death")
func murioempi():
	$AnimatedSprite2D.play("deathempi")
func ganoEmpi():
	print("supuestamente estoy bailando")
	$AnimatedSprite2D.play("winEmpi")
func ganoRacio():
	print("supuestamente entre")
	$AnimatedSprite2D.play("winRacio")
func perdioempi():
	$AnimatedSprite2D.play("perdioEmpi")
func perdioRacio():
	$AnimatedSprite2D.play("perdioRacio")
func fatalitiRacio():
	$AnimatedSprite2D.play("fatalRacio")
func fatalitiempi():
	$AnimatedSprite2D.play("fatalempi")
