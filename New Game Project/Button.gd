extends Button

var change_scene = load("res://CREATEUSER.tscn")
# Called when the node enters the scene tree for the first time.


func _on_pressed()-> void :
	get_tree().change_scene_to_packed(change_scene)
