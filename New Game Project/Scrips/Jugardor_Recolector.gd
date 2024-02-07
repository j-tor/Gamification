extends CharacterBody2D


var speed := 300
@onready var animated_sprite_2d = $AnimatedSprite2D
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _process(delta):
	pass

func imput(event): 
	pass

func _init():
	pass


func _physics_process(delta):
	var inputVel = Input.get_axis("ui_left","ui_right")
	var apresteSalto = Input.get_action_raw_strength("ui_accept") 
	
	velocity.x= inputVel * speed
	
	if apresteSalto !=0:
		velocity.y =0
		velocity.y -= apresteSalto * 400
	
	
	
	if !is_on_floor():
		velocity.y +=20
	move_and_slide()
	if velocity.x !=0: 
		animated_sprite_2d.play("run")
	else: 
		animated_sprite_2d.play("idle")
	if inputVel!= 0:
		animated_sprite_2d.flip_h = inputVel < 0
		
	
func subirScore():
	print("subir up")
func morirse():
	print("Ay me mori")
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
