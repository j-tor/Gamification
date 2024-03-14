extends Node

var save_filename ="user://save_data.save"
# Called when the node enters the scene tree for the first time.
func _ready():
	load_juego()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_menu"):
		print("guardado")
		save_juego()

func save_juego():
	var save_file = FileAccess.open(save_filename, FileAccess.WRITE) 
	
	var save_node = get_tree().get_nodes_in_group("saver")
	for node in save_node:
		if node.filename.empty():
			break
		
		var node_details = node.save_game()
		#save_file.store_line(to_json(node_details))
	
func load_juego():
	pass
