extends Control

var change_scene = load("res://LOGIN.tscn")
# Called when the node enters the scene tree for the first time.


@onready var POPUP= $Window


var game_data=[{
	"user":"admin",
	"pass":"admin"
}]
const SAVEFILE = "user://SAVEFILE.save"


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






func _on_button_2_pressed()-> void :
	print($TextEdit2.text)
	print($TextEdit.text)
	
	var Existe = false
	
	for n in range (len(game_data)):
		if(game_data[n].user == $TextEdit.text):
			$Window/RichTextLabel.text = "no se puede crear usuario ya existe"
			print("no se puede crear usuario ya existe")
			Existe = true
	
	if(!Existe):
		game_data.append({"user":$TextEdit2.text, "pass":$TextEdit.text})
		_savedate()
		$Window/RichTextLabel.text = "Usuario Creado"
		
		
	POPUP.show()

	
	
	


func _on_button_pressed():
	
	if $Window/RichTextLabel.text == "Usuario Creado":
		get_tree().change_scene_to_packed(change_scene)
	POPUP.hide()
	
	pass # Replace with function body.
