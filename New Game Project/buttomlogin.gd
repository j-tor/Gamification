extends Control

var change_scene1 = load("")
# Called when the node enters the scene tree for the first time.


func _on_button_2_pressed()-> void :
	get_tree().change_scene_to_packed(change_scene1)
