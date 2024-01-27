extends CharacterBody2D



@onready var animations = $AnimationPlayer
@export var speed = 500
func updateAnimation():
	
	var direction = "Walk"
	if velocity.x < 0 : direction = "left"
	elif velocity.x > 0 : direction = "right"
	elif velocity.y <  0 : direction = "up"
	elif velocity.y > 0 : direction = "down"
	
	animations.play("Walk_"+direction)


func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	updateAnimation()
	
	if velocity.length() >= 0:
		rotation = velocity.angle()

