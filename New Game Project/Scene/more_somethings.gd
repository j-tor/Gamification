extends Control
var puntosPlayer=0
var ganoElementJuegoDeJeffrey
var JuegoDeKennyRecolector
var SegundoGameKennyGalaga
var GanoGameMaria
var HabloconBruja
var GanoCombat
var GanoAula
var GanoLab
var CompletoRuleta=false
func _ready():
	ocultarTodo()
	$Status/ProgressBar.value = 0
	puntosPlayer= Main.puntosPlayer
	ganoElementJuegoDeJeffrey = Main.ganoElementJuegoDeJeffrey
	JuegoDeKennyRecolector= Main.JuegoDeKennyRecolector
	SegundoGameKennyGalaga = Main.SegundoGameKennyGalaga
	GanoGameMaria = Main.GanoGameMaria
	HabloconBruja = Main.HabloconBruja
	GanoCombat = Main.GanoCombat
	GanoAula = Main.GanoAula
	$puntos.text= str(puntosPlayer)
	
	if SegundoGameKennyGalaga==true:
		$Status/JuegoPolitica.text="Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if JuegoDeKennyRecolector==true:
		$Status/JuegoArte.text-"Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoGameMaria==true:
		$Status/JuegoHistoria.text="Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if ganoElementJuegoDeJeffrey==true:
		$Status/JuegoCiencia.text="Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	
	if HabloconBruja==true:
		$Status/ElegirBando.text = "Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if ganoElementJuegoDeJeffrey==true && JuegoDeKennyRecolector==true && SegundoGameKennyGalaga==true && GanoGameMaria==true:
		$Status/CompletarRuleta.text= "Completado"
		CompletoRuleta=true
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoCombat==true: 
		$Status/CombateEmpiristas.text="Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoAula==true:
		$Status/JuegoAula.text= "Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoLab==true:
		$Status/JuegoLaboratorio.text="Completado"
		$Status/ProgressBar.value += 10 * 100/ 100
	
	if CompletoRuleta==true && GanoLab==true && GanoAula==true && GanoCombat==true &&HabloconBruja==true:
		$Status/CompletarJuego.text= "Completado"
		$Status/ProgressBar.value += 10 * 100/ 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_buy_velocity_pressed():
	print("Comprar velocidad")


func _on_buyheart_pressed():
	print("Comprar corazon")


func _on_buy_points_pressed():
	print("Comprar puntos")


func _on_button_status_2_pressed():
	ocultarTodo()
	$Status.show()

func ocultarTodo():
	$Tienda.hide()
	$Status.hide()


func _on_button_tienda_pressed():
	ocultarTodo()
	$Tienda.show()
