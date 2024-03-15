extends Node

var ataque_jugador = false
var objetivo_enemigo = 1
var objetivo_player  = 1
var banco
var juego
var bando=""
var bruja=false
#dialogos
var color 
var GreeGame=false
var pinkGame=false
var BlueGame=false
var yellowGame=false
var Vida_base=0
var Velocidad=0
var Recistencia=5
var Emanuelstatus="Introduccion"
var Ancianostatus
var habloWin=false
var RecogerPosima=false
var posimaAulaReco=false
var habloaula=false
var hablobiblio=false
var hablo=false
var nombre_objeto = false
var terminovideoIntro=false

var dialogo_objeto = []
var rulet=false
var seleccionado
var lab=0

var User
var Data
var progreso
# para almacenar que juegos gano
var ganoElementJuegoDeJeffrey=false
var JuegoDeKennyRecolector=false
var SegundoGameKennyGalaga=false
var GanoGameMaria=false
var HabloconBruja=false
var GanoCombat=false
var puntosPlayer=5000
var GanoAula=false
var GanoLab= false

#Para regreso de lugares
var VieneRuleta=false
var VineBruja=false
var vieneGameWar=false
var vieneEleccionBando=false 
var vieneUni=false

func _game():
	randomize()
	_dialogo()
	
	
	

func _dialogo():
	if bando == "Racionalista" || Main.bando == "Empirista":

		seleccionado = true
	else:
		color =false
	
	print(banco)	
	match nombre_objeto:
		"Entradas":
			dialogo_objeto = [
				"Esta cerrado...",#0
				"Tienes que cumplir con la misión de la ruleta antes.",#1
				"Regresa despues..."#2
			]
		"Entrada a ruleta":
			dialogo_objeto = [
				"Bienvenido a la Ruleta del saber.",#0
				"Para girar presione F. ",#1
				"Para regresar preciona E..."#2
			]
			rulet=false
		"Empirista":
			if bando=="Empirista":
				HabloconBruja=true
				dialogo_objeto = [
					"Has elejido el camino Empirista...",#0
					"Dirigete al castillo para el combate por el conocimiento.",#1
					]
				
			elif bando=="":
				dialogo_objeto = [
					"Sopa del conocimiento Empirista... ",#0
					"Habla con la buja para poder tomarla...",#1
					]
			if seleccionado == true && color==true :
				dialogo_objeto = [
						"Ya elejiste el bando... ",#0
						]
		"Racionalista":
			if bando=="Racionalista":
				HabloconBruja=true
				dialogo_objeto = [
					"Has elejido el camino Racionalista...",#0
					"Dirigete al castillo para el combate por el conocimiento.",#1
					]

			elif bando=="":
				dialogo_objeto = [
					"Sopa del conocimiento Racionalista...",#0
					"Habla con la buja para poder tomarla...",#1
					]
				
			if seleccionado == true && color==true :
				dialogo_objeto = [
						"Ya elejiste el bando...",#0
						]
						
		"Bruja":
			dialogo_objeto = [
					"He preparado dos caldos con el conocimiento Epistemefigther.",#0
					"Estos caldos te van ayudar en tu siguiente combate.",#1
					"El caldo azul de brindará todo el conocimiento Racionalista.",#2
					"El caldo Rojo de brindará todo el conocimiento Empirista.",#3
					"Elige sabiamente cuál tomar...",#4
					]
		"ghost":
			dialogo_objeto = [
					"Te encuentras en el Royal Valey.",#0
					"Por tu valentía ahora tienes mas Velocidad.",#1
					]
		"Caballero":
			dialogo_objeto = [
					"¡Bienvenido al castillo!",#0
					"¡Espero que tengas un buen día!",#1
					]
		"Princesa":
			dialogo_objeto = [
					"Hola, soy la Princesa....",#0
					"¡Has completado todos los niveles de la Ruleta!",#1
					"Ve donde la Bruja para tomar tu poción de conocimiento!",#2
					"Abre tu mapa para ver donde esta la bruja... tecla(M) ",#3
					]
		"Vendedora":
			dialogo_objeto = [
					"Hola, soy Malo...",#0
					"¡Vendo leche fresca!",#1
					"¡Tomar leche fortalece tus huesos y proporciona vitaminas!",#2
					"¡Cómprame un frasco de leche!",#3
					]
		"Caballo":
			dialogo_objeto = [
					"Brr....",#0
					"Brrr.. brr..",#1
					]
		"Emanuel":
			if Emanuelstatus=="Introduccion":
				habloaula=true
				if habloaula==true && hablobiblio==true:
					hablo=true
				dialogo_objeto = [
						"Bienvenido, soy Emanuel Kant. Me han hablado mucho de ti, quiero saber si lo que dicen es cierto.",#0
						"Por eso e preparado un examen para ti, ¿vez la barra de arriba? Esta aumentará según respondas bien.",#1
						"Debes de buscar en esta aula y en la biblioteca que esta al final del pasillo, las preguntas que e preparado para ti.",#2
						"Recuerda, para demostrame que mereces salir, deberas sacar mas del 60%.",#3
						"Te dare una pista, debes de leer mucho... ven hablar conmigo cuando termines y mucha suerte.",#4
						]
			elif Emanuelstatus=="Biblioteca":
				hablobiblio=true
				if habloaula==true && hablobiblio==true:
					hablo=true
				dialogo_objeto = [
						"Bienvenido, esta es la biblioteca. Aquí encontrarás nuevos desafíos. ",#0
						"Pista: debes de leer hasta el cansancio. Por cierto, recuerda tus conocimientos en ecología.",#1
						]
		"Anciano":
			if Ancianostatus=="No gano":
				dialogo_objeto = [
						"No has ganado todavia.",#1
						]
			elif Ancianostatus=="Gano":
				habloWin=true
				RecogerPosima=true
				dialogo_objeto = [
						"Has ganado, ten tu regalo. Ya puedes salir... He escuchado que tu siguiente desafio no será tan fácil, mucha suerte y sigue así.",#1
						]
			elif Ancianostatus=="Perdio":
				dialogo_objeto = [
						"Has perdido, regresa al mundo y entrena un poco para que lo vuelves a intentar.",#1
						]
		"Cientifico":
			if lab>=4:
				GanoLab==true
				dialogo_objeto = [
						"Has completado todo el laboratorio.",#0
						"Te graduste ya de un científico explorador.",#1
						"¡Felicidades...!",#2
						]
			else:
				dialogo_objeto = [
						"Bienvenido al Lab de Unitec.",#0
						"Este laboratorio está equipado para que hagas toda la práctica.",#1
						"Empieza yendo a la máquina de la EVIDENCIA que se encuentra a la izquierda.",#2
						"Para interactuar con ella, presiona (F).",#3
						]
		"Maquina2":
			dialogo_objeto = [
					"La máquina creadora de EVIDENCIA.",#0
					"La máquina requiere que coloques los tubos correctamente para poder alimentarse.",#1
					"Una ves alimentada, recojes EVIDENCIA.",#2
					"Dirígete a la mesa del ANÁLISIS.",#3
					]
		"ANALISIS":
			dialogo_objeto = [
					"La mesa del ANÁLISIS",#0
					"En esta mesa verás el proceso de eclosión de un huevo de Spiked Beetle.",#1
					"Una vez completes el proceso. dirígete a la mesa de la SÍNTESIS.",#2
					]
		"SINTESIS":
			dialogo_objeto = [
					"La mesa del SÍNTESIS",#0
					"En esta mesa verás los tipos de Spiked Beetle y sus colores según sus huevos.",#1
					"una ves completes de verlos todos, dirigete a la mesa de la ENUMERACIÓN.",#2
					]
		"ENUMERACIÓN":
			dialogo_objeto = [
					"La mesa de la ENUMERACIÓN",#0
					"En esta mesa verás el proceso y ciclo de Spiked Beetle desde que pone los huevos hasta cuando nace la cría.",#1
					"Una vez completes de verlos todos, dirígete a hablar con el Científico.",#2
					]
			lab=4
		"Comerciante":
			dialogo_objeto = [
								"Hola, soy el comerciante. Dentro de mi caja tengo unos objetos que puedes ganar. ¿Quieres jugar? Solo son 100 minishtaf.",#0
					]
