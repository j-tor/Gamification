extends CharacterBody2D


const SPEED = 5.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	#para regresar el objeto
	position.x = 530

func _physics_process(delta):
	if position.y < 550:
		position.y += SPEED
		

func _on_entered_body_entered(body):
	pass

