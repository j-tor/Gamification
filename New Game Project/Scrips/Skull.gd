extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Input.is_action_just_pressed("ui_accept"):
		#$AnimatedSprite2D.play("damage")
		#$AnimatedSprite2D.play("idle")
	
	

func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("idle")

func _damage():
	$AnimatedSprite2D.play("damage")

func dead():
	$AnimatedSprite2D.play("dead")
