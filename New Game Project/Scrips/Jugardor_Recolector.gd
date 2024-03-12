extends CharacterBody2D


var speed := 300
signal scoreUP
signal playedDied
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
	
	if apresteSalto !=0 and is_on_floor():
		velocity.y =0
		velocity.y -= apresteSalto * 600
	
	
	
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
	$SubirSonido.play()
	emit_signal("scoreUP")

func morirse():
	$"../PointLight2D".hide()
	$morirSonido.play()
	animated_sprite_2d.play("hurt")
	emit_signal("playedDied")

func gano():
	animated_sprite_2d.play("win")
	$corazon.show()
	await get_tree().create_timer(3).timeout
	$corazon.hide()
	Main.JuegoDeKennyRecolector=true
