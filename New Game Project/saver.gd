extends Control

var username = ""
const SAVEFILE = "user://SAVEFILE.save"

var game_data=[{
	"user":"admin",
	"pass":"admin"
}]

@onready var POPUP = $Window


func _ready():
	_loaddata()
	POPUP.show()
	return true
	
func _loaddata(): 
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if file == null: 
		_savedate()
		
	else:
		game_data = file.get_var()
		
	return true
	
func _savedate():
	
	print("¨Funcion SaveData¨")
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)  
	file.store_var(game_data)
	
	return true




func _on_button_login_pressed():
	
	
	print($TextEdit.text)
	print($TextEdit2.text)

	print(game_data)
	for n in range (len(game_data)):
		if(game_data[n].user == $TextEdit.text):
			if(game_data[n].pass == $TextEdit.text):
				print("Login Exitoso")
				var change_scene2 = load("res://mundo.tscn")
				get_tree().change_scene_to_packed(change_scene2)
			
	

	
	


func _on_button_pressed():
	POPUP.hide()
	pass # Replace with function body.
