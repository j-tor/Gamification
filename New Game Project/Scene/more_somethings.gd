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
var unavez1=false
var unavez2=false
var unavez3=false
var unavez4=false
var unavez5=false
var unavez6=false
var unavez7=false
var unavez8=false
var unavez9=false
var unavez0=false
var cantidad=0
var segundacantidad=0
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
	GanoLab= Main.GanoLab
	if Main.lab>=4:
		GanoLab=true
	$puntos.text= str(puntosPlayer)
	
	if SegundoGameKennyGalaga==true:
		$Status/JuegoPolitica.text="Completado"
		if unavez1==false:
			unavez1=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if JuegoDeKennyRecolector==true:
		$Status/JuegoArte.text="Completado"
		if unavez2==false:
			unavez2=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoGameMaria==true:
		$Status/JuegoHistoria.text="Completado"
		if unavez3==false:
			$Status/ProgressBar.value += 10 * 100/ 100
			unavez3=true
	
	if ganoElementJuegoDeJeffrey==true:
		$Status/JuegoCiencia.text="Completado"
		if unavez4==false:
			unavez4=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	
	if HabloconBruja==true:
		$Status/ElegirBando.text = "Completado"
		if unavez5==false:
			unavez5=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if ganoElementJuegoDeJeffrey==true && JuegoDeKennyRecolector==true && SegundoGameKennyGalaga==true && GanoGameMaria==true:
		$Status/CompletarRuleta.text= "Completado"
		CompletoRuleta=true
		if unavez6==false:
			unavez6=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoCombat==true: 
		$Status/CombateEmpiristas.text="Completado"
		if unavez7==false:
			unavez7=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoAula==true:
		$Status/JuegoAula.text= "Completado"
		if unavez8==false:
			unavez8=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoLab==true:
		$Status/JuegoLaboratorio.text="Completado"
		if unavez9==false:
			unavez9=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if CompletoRuleta==true && GanoLab==true && GanoAula==true && GanoCombat==true &&HabloconBruja==true:
		$Status/CompletarJuego.text= "Completado"
		if unavez0==false:
			unavez0=true
			$Status/ProgressBar.value += 10 * 100/ 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	puntosPlayer= Main.puntosPlayer
	ganoElementJuegoDeJeffrey = Main.ganoElementJuegoDeJeffrey
	JuegoDeKennyRecolector= Main.JuegoDeKennyRecolector
	SegundoGameKennyGalaga = Main.SegundoGameKennyGalaga
	GanoGameMaria = Main.GanoGameMaria
	HabloconBruja = Main.HabloconBruja
	GanoCombat = Main.GanoCombat
	GanoAula = Main.GanoAula
	GanoLab= Main.GanoLab
	$puntos.text= str(puntosPlayer)
	
	if SegundoGameKennyGalaga==true:
		$Status/JuegoPolitica.text="Completado"
		if unavez1==false:
			unavez1=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if JuegoDeKennyRecolector==true:
		$Status/JuegoArte.text="Completado"
		if unavez2==false:
			unavez2=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoGameMaria==true:
		$Status/JuegoHistoria.text="Completado"
		if unavez3==false:
			$Status/ProgressBar.value += 10 * 100/ 100
			unavez3=true
	
	if ganoElementJuegoDeJeffrey==true:
		$Status/JuegoCiencia.text="Completado"
		if unavez4==false:
			unavez4=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	
	if HabloconBruja==true:
		$Status/ElegirBando.text = "Completado"
		if unavez5==false:
			unavez5=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if ganoElementJuegoDeJeffrey==true && JuegoDeKennyRecolector==true && SegundoGameKennyGalaga==true && GanoGameMaria==true:
		$Status/CompletarRuleta.text= "Completado"
		CompletoRuleta=true
		if unavez6==false:
			unavez6=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoCombat==true: 
		$Status/CombateEmpiristas.text="Completado"
		if unavez7==false:
			unavez7=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoAula==true:
		$Status/JuegoAula.text= "Completado"
		if unavez8==false:
			unavez8=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if GanoLab==true:
		$Status/JuegoLaboratorio.text="Completado"
		if unavez9==false:
			unavez9=true
			$Status/ProgressBar.value += 10 * 100/ 100
	
	if CompletoRuleta==true && GanoLab==true && GanoAula==true && GanoCombat==true &&HabloconBruja==true:
		$Status/CompletarJuego.text= "Completado"
		if unavez0==false:
			unavez0=true
			$Status/ProgressBar.value += 10 * 100/ 100


func _on_buy_velocity_pressed():
	print("Comprar velocidad")
	if puntosPlayer>=500 && cantidad<3:
		Main.puntosPlayer-=500
		Main.Velocidad+=20
		$Tienda/FinishBuy.play()
		cantidad+=1
	else:
		$Tienda/NoBuy.play()


func _on_buyheart_pressed():
	print("Comprar corazon")
	if puntosPlayer>=500 && segundacantidad<2:
		Main.puntosPlayer-=500
		Main.Vida_base+=20
		$Tienda/FinishBuy.play()
		segundacantidad+=1
	else:
		$Tienda/NoBuy.play()


func _on_buy_points_pressed():
	print("Comprar puntos")
	if puntosPlayer>=250:
		Main.puntosPlayer-=250
		
		var Rambom = randi() % 6
		var Gano
		if Rambom ==0:
			Gano=-200
		elif Rambom==1:
			Gano=100
		elif Rambom==2:
			Gano=-100
		elif Rambom==3:
			Gano=500
		elif Rambom==4:
			Gano=1000
		elif Rambom==5:
			Gano=250
		$Tienda/RevenderHuevo.play()
		$Tienda/RevenderHuevo.show()
		await get_tree().create_timer(1.5).timeout
		$Tienda/RevenderHuevo.hide()
		$Tienda/Label3.text=str(Gano)
		$Tienda/Label3.show()
		Main.puntosPlayer+=Gano
		$Tienda/FinishBuy.play()
		await get_tree().create_timer(2).timeout
		$Tienda/Label3.hide()
	else:
		$Tienda/NoBuy.play()


func _on_button_status_2_pressed():
	ocultarTodo()
	$Status.show()

func ocultarTodo():
	$Tienda.hide()
	$Status.hide()


func _on_button_tienda_pressed():
	ocultarTodo()
	$Tienda.show()


func _on_button_back_pressed():
	$"..".hide()
	ocultarTodo()
