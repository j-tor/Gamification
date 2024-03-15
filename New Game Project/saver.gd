extends Control
var loginExitoso=false
var username = ""
const SAVEFILE = "user://SAVEFILE.save"
var mirovideo=false
var game_data=[{
	"user":"admin",
	"pass":"admin"
}]

@onready var POPUP = $Window
func _physics_process(delta):
	if Main.terminovideoIntro==true:
		$CanvasLayer/VideoStreamPlayer.stop()
		$CanvasLayer/VideoStreamPlayer.eliminar()
		get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="mundo1"
		get_tree().get_nodes_in_group("GAME")[0].ubicacion = Vector2(193,1530)
		get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
		get_tree().get_nodes_in_group("Login")[0].queue_free()

func _ready():
	$CanvasLayer/VideoStreamPlayer.parar()
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
				Main.User=$TextEdit.text
				GameSave.load_juego()
				print("Login Exitoso")
				
				loginExitoso=true
				#var change_scene2 = load("res://mundo.tscn")
				#get_tree().change_scene_to_packed(change_scene2)
				#change_scene2.instantiate()
				#verVideo()
				#get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="mundo1"
				#get_tree().get_nodes_in_group("GAME")[0].ubicacion = Vector2(193,1530)
				#get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
				#get_tree().get_nodes_in_group("Login")[0].queue_free()
				break;
				
	POPUP.show()
	

	
	


func _on_button_pressed():
	if loginExitoso == true:
		$NinePatchRect.hide()
		$MarginContainer.hide()
		$Button_Login.hide()
		$Button_CreateUser.hide()
		$TextEdit.hide()
		$TextEdit2.hide()
		$Window.hide()
		$CanvasLayer.show()
		$CanvasLayer/VideoStreamPlayer.ver()
	
	if $Window/RichTextLabel.text=="Login Exitoso" && mirovideo==true:
		
		pass
		#var change_scene2 = load("res://mundo.tscn")
		#get_tree().change_scene_to_packed(change_scene2)
		#change_scene2.instantiate()
	POPUP.hide()
		
	pass # Replace with function body.
func verVideo():
	$NinePatchRect.hide()
	$MarginContainer.hide()
	$Button_Login.hide()
	$Button_CreateUser.hide()
	$TextEdit.hide()
	$TextEdit2.hide()
	$Window.hide()
	
	$CanvasLayer.show()
	$CanvasLayer/VideoStreamPlayer.ver()

func _on_omitir_pressed():
	$CanvasLayer/VideoStreamPlayer.stop()
	$CanvasLayer/VideoStreamPlayer.eliminar()
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="mundo1"
	get_tree().get_nodes_in_group("GAME")[0].ubicacion = Vector2(193,1530)
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("Login")[0].queue_free()
