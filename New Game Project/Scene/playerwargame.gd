extends CharacterBody2D

var elecionPLayer="Empirista"
const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var countdown_timer = 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if elecionPLayer=="Racionalista":
		$AnimatedSprite2D.play("normal")
	elif elecionPLayer=="Empirista":
		$AnimatedSprite2D.play("normalempi")
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

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
