extends Node
var User= Main.User
var save_filename ="user://save_data.save"

var Data  = [{
	"User":"jeff",
	"Vida":1,
	"bando":"Main.bando9999",
	"puntos": 87,
	"Velocidad":855
}]

var game_data = [{
	"User":"jeff",
	"Vida":1,
	"bando":"Main.bando",
	"puntos": 85,
	"Velocidad":855
}]

	
func _loaddata(): 
	var file = FileAccess.open(save_filename, FileAccess.READ)
	if file == null: 
		_savedate()
	else:
		if Data ==  null:
			game_data = file.get_var()
			for n in range (len(save_filename)):
				if(Data[n].User == User):
					
					_savedate()
					print("Datos con el for")
					print("Datos-jeff")
					print(Data)
					print("Datos-Maria")
					print(game_data)
					break
		
	return true
	
func _savedate():
	
	print("¨Funcion SaveData¨")
	var file = FileAccess.open(save_filename, FileAccess.WRITE)  
	file.store_var(Data)
	file.append(Data)
	return true


# Called when the node enters the scene tree for the first time.
func _ready():
	_loaddata()
	print("Datos-jeff")
	print(Data)
	print("Datos-Maria")
	print(game_data)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_text_caret_line_end.macos"):
		print("guardado")
		_savedate()
	else:
		pass
		

		
		
		

