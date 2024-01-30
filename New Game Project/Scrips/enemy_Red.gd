extends Node2D


var vida = 5
var damage = 2
var Vida_maxima = 5

var  damage_recibido = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D.visible = false
	$ProgressBar.value = vida * 100/ Vida_maxima
	

func _damage():
	$Node2D.visible = true
	$Node2D/Label.text = str(damage_recibido)
	$AnimationPlayer.play(damage)
	$ProgressBar.value = vida * 100/ Vida_maxima
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	$Cursor.visible = true
	


func _on_area_2d_mouse_exited():
	$Cursor.visible = false


func _on_animation_player_animation_finished(anim_name):
	if vida <= 0:
		if anim_name == "damage":
			queue_free()
	
