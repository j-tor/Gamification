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
	POPUP.hide()
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
	$Window/RichTextLabel.text="Usuario Incorrecto"
	for n in range (len(game_data)):
		if(game_data[n].user == $TextEdit2.text):
			$Window/RichTextLabel.text="Contrasena Incorrecta"
			if(game_data[n].pass == $TextEdit.text):
				$Window/RichTextLabel.text="Login Exitoso"
				print("Login Exitoso")
				
				var login = preload("res://LOGIN.tscn")
				login.instantiate()
				break;
				
	POPUP.show()
	

	
	


func _on_button_pressed():
	if $Window/RichTextLabel.text=="Login Exitoso":
		var change_scene2 = load("res://mundo.tscn")
		get_tree().change_scene_to_packed(change_scene2)
		change_scene2.instantiate()
	POPUP.hide()
		
	pass # Replace with function body.
