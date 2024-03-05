extends CharacterBody2D
#empiristas con vestimenta roja y racionalistas con vestimenta blanca
#var elecionPLayer=Main.bando
#var elecionPLayer=Main.bando
var elecionPLayer="Racionalista"

#rango 260-350 
var SPEED = randi_range(205,310)
const JUMP_VELOCITY = -400.0
const direction =-1
var countdown_timer=3
var estadoCorrer=false
var numero
var RepuestaUser=" "
var RespuestaCorrecta=" "
var Round=1
var Gano="Nadie"
var Respondio=false 
var Elecionenemy
var RespondioEnemy=false
var repondioPLayerBien
var puntoPLayer=0;
var puntosEnemy=0
var RoundsPlayer=0
var RoundsEnemy=0
var correctplayer
var celebrar=false
var win ="Nadie"
# Get the gravity from the project settings to be synced with RigidBody nodes.d
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if celebrar==false:
		if position.y < 600:
			position.y += 5
		if estadoCorrer==true:
		#if elecionPLayer=="Racionalista":
			if correctplayer=="Empirista":
				$AnimatedSprite2D.play("runempi")
			elif correctplayer=="Racionalista":
				$AnimatedSprite2D.play("runracion")
			velocity.x = direction * SPEED
			move_and_slide()
			if position.x<613:
				estadoCorrer=false
		else:
			_Correrstop()
		$"../Informacion/Round".text= str(Round)
		$"../Informacion/PlayerPuntos".text = str(puntoPLayer)
		$"../Informacion/EnemyPuntos2".text = str(puntosEnemy)
		if Gano=="Player"||Gano=="Enemy" && Respondio==false:
			ManagerGame()
	else:
		Fin()
		estadoCorrer=false
		$"../Informacion/Timer".stop()
		#siguienteRound()
	#ManagerGame()

func _on_area_2d_area_entered(area):
	pass
	#print(str(area))
	#print("Entro el enemigo en player,skeletron")
	#ED)
	
func _ready():
	
	if elecionPLayer=="Racionalista":
		correctplayer="Empirista"
	elif elecionPLayer=="Empirista":
		correctplayer="Racionalista"
		print(correctplayer)
	if correctplayer=="Empirista":
		$AnimatedSprite2D.play("idle")
	elif correctplayer=="Racionalista":
		$AnimatedSprite2D.play("idleracio")
	#Intruciones()
	ManagerGame()

func Intruciones():
	$"../Informacion".hide()
	$"../InfoStart".show()
	get_tree().paused = true
	await get_tree().create_timer(30).timeout
	get_tree().paused = false
	$"../InfoStart".hide()
	$"../Informacion".show()

func ManagerGame():
	if celebrar==false:
		if position.y < 600:
			position.y += 5
		if estadoCorrer==true:
			if correctplayer=="Empirista":
				$AnimatedSprite2D.play("run")
			elif correctplayer=="Racionalista":
				$AnimatedSprite2D.play("runracion")
			velocity.x = direction * SPEED
			move_and_slide()
		else:
			if correctplayer=="Empirista":
				$AnimatedSprite2D.play("idle")
			elif correctplayer=="Racionalista":
				$AnimatedSprite2D.play("idleracio")
			_Correrstop()
		if Round==1 || Round==2 || Round==3 || Round==4|| Round==5:
			if Gano=="Nadie":
				_Correrstop()
				$"../Informacion/Timer".start()
				_on_timer_timeout()
			elif Gano=="Player" && Respondio==false:
				QuestionDo()
				$"../DirectionalLight2D".hide()
				$"../Informacion".hide()
				$"../Questions".show()
				Respondio=true
			elif Gano=="Enemy" && RespondioEnemy==false :
				if correctplayer=="Empirista":
					$AnimatedSprite2D.play("idle")
				elif correctplayer=="Racionalista":
					$AnimatedSprite2D.play("idleracio")
				$"../Informacion/Inforound".text="Eligiendo..."
				$"../Informacion/Segundos".text=" "
				$"../Informacion/Round".text=" "
				get_tree().paused = true
				await get_tree().create_timer(3).timeout
			
				if Elecionenemy==true:
					$"../Informacion/Inforound".text="Enemy acerto"
				
					if elecionPLayer=="Empirista":
						$"../player".murioempi()
						$AnimatedSprite2D.play("ataqueracio")
					elif elecionPLayer=="Racionalista":
						$"../player".murio()
						$AnimatedSprite2D.play("ataque")
					print("Repondio bien")
				elif Elecionenemy==false:
					$"../Informacion/Inforound".text="Enemy se equivoco"
					print ("Respondio mal")
					if elecionPLayer=="Empirista":
						$"../player".enviarataqueRojo()
						$AnimatedSprite2D.play("deathracio")
					elif elecionPLayer=="Racionalista":
						$"../player".enviarataqueblanco()
						$AnimatedSprite2D.play("death")
				await get_tree().create_timer(2).timeout
				$"../CharacterBody2D".show()
				get_tree().paused = false
				$"../Informacion/Inforound".text="Round"
				$"../Informacion/Round".text= str(Round)
				countdown_timer=3
				EleccionEnemy()
				RespondioEnemy=true
				if Round==4 && RoundsEnemy>RoundsPlayer && puntosEnemy==2|| Round==4 && RoundsPlayer>RoundsEnemy && puntoPLayer==2 || Round==5 && RoundsEnemy>RoundsPlayer && puntosEnemy==2|| Round==5 && RoundsPlayer>RoundsEnemy && puntoPLayer==2:
					siguienteRound()
				else:
					reiniciar()
		

func _on_timer_timeout():
	if countdown_timer > 0:
		$"../Informacion/Segundos".text = str(countdown_timer)
		countdown_timer -= 1
	else:
		$"../Informacion/Segundos".text = "¡Ya!"
		$"../Informacion/Timer".stop()
		if celebrar==false:
			estadoCorrer=true
		$"../StaticBody2D/CollisionStopPlayer".position=Vector2(5000,5000)
func _Correrstop():
	if correctplayer=="Empirista" :
		$AnimatedSprite2D.play("idle")
	elif correctplayer=="Racionalista":
		$AnimatedSprite2D.play("idleracio")

func QuestionDo():
	numero = randi() % 7
	print(numero)
	if numero==0:
		$"../Questions/DoQuestion".text="Para algunos de los siguientes filósofos, el criterio de verdad es la \nevidencia sensible:
A) Empiristas. B) Criticistas. C) Racionalistas. D) Dogmáticos"
		RespuestaCorrecta="Empiristas"
	elif numero==1:
		$"../Questions/DoQuestion".text="De las siguientes, una de ellas es la corriente filosófica que en general \ntiende a negar la posibilidad de la metafísica y a sostener que hay \nconocimiento únicamente de los fenómenos \n A) Racionalistas. B) Empiristas. C) Escolásticos. D) Escépticos"
		RespuestaCorrecta="Empiristas"
	elif numero==2:
		$"../Questions/DoQuestion".text="Para unos de los siguientes filósofos, la experiencia como única fuente \ndel conocimiento.
A) Epistemólogos. B) Racionalistas. C) Empiristas. D) Escépticos"
		RespuestaCorrecta="Empiristas"
	elif numero==3:
		$"../Questions/DoQuestion".text="Filósofos para quienes la única fuente del conocimiento es la razón.
A) Epistemólogos. B) Racionalistas. C) Empiristas. D) Escépticos"
		RespuestaCorrecta="Racionalistas"
	elif numero==4:
		$"../Questions/DoQuestion".text="Filósofos que postulan las ideas innatas en el sujeto.
A) Empiristas. B) Idealistas. C) Racionalistas. D) Innatistas"
		RespuestaCorrecta="Racionalistas"
	elif numero==5:
		$"../Questions/DoQuestion".text="De los siguientes filósofos selecciones el que no se considera \nRacionalista:\n
A) David Hume. B) John Locke. C) Nicolas Malebranch. D) Francis Bacon"
		RespuestaCorrecta="Nicolas Malebranch"
	elif numero==6:
		$"../Questions/DoQuestion".text="Es la doctrina que establece que todos nuestros conocimientos \nprovienen de la razón.
A) Empirismo. B) Criticismo. C) Racionalismo. D) Epistemología"
		RespuestaCorrecta="Racionalismo"
	elif numero==7:
		$"../Questions/DoQuestion".text="Uno de los siguientes filósofos, postula las ideas innatas en el sujeto:
A) George Berkeley. B) David Hume. C) Leibniz. D) Hipatía"
		RespuestaCorrecta="Leibniz"
	



func _on_area_2d_body_entered(body):
	#print("entro algo")
	if body.is_in_group("jugador"):
		print("gano usted")
		Gano="Player"
		estadoCorrer=false
	if body.is_in_group("Enemy"):
		print("gano el enemigo")
		Gano = "Enemy"

func EleccionEnemy():
	var posibilidad
	if correctplayer=="Empirista":
		posibilidad=4
	elif correctplayer=="Racionalista":
		posibilidad=3
	
	var posibility= randi() % 9
	if posibility<posibilidad:
		Elecionenemy=false
		puntoPLayer+=1
	else:
		Elecionenemy=true
		puntosEnemy+=1


func _on_respuesta_a_pressed():
	print("a")
	if numero==0:
		RepuestaUser="Empiristas"
	elif numero==1:
		RepuestaUser="Racionalistas"
	elif numero==2:
		RepuestaUser="Epistemólogos"
	elif numero==3:
		RepuestaUser="Epistemólogos"
	elif numero==4:
		RepuestaUser="Empiristas"
	elif numero==5:
		RepuestaUser="David Hume"
	elif numero==6:
		RepuestaUser="Empirismo"
	elif numero==7:
		RepuestaUser="George Berkeley"
	ValiarEleccion()


func _on_respuesta_b_pressed():
	print("b")
	if numero==0:
		RepuestaUser="Criticistas"
	elif numero==1:
		RepuestaUser="Empiristas"
	elif numero==2:
		RepuestaUser="Racionalistas"
	elif numero==3:
		RepuestaUser="Racionalistas"
	elif numero==4:
		RepuestaUser="Idealistas"
	elif numero==5:
		RepuestaUser="John Locke"
	elif numero==6:
		RepuestaUser="Criticismo"
	elif numero==7:
		RepuestaUser="David Hume"
	ValiarEleccion()

func _on_respuesta_c_pressed():
	print("c")
	if numero==0:
		RepuestaUser="Racionalistas"
	elif numero==1:
		RepuestaUser="Escolásticos"
	elif numero==2:
		RepuestaUser="Empiristas"
	elif numero==3:
		RepuestaUser="Empiristas"
	elif numero==4:
		RepuestaUser="Racionalistas"
	elif numero==5:
		RepuestaUser="Nicolas Malebranch"
	elif numero==6:
		RepuestaUser="Racionalismo"
	elif numero==7:
		RepuestaUser="Leibniz"
	ValiarEleccion()

func _on_respuesta_d_pressed():
	print("d")
	if numero==0:
		RepuestaUser="Dogmáticos"
	elif numero==1:
		RepuestaUser="Escépticos"
	elif numero==2:
		RepuestaUser="Escépticos"
	elif numero==3:
		RepuestaUser="Escépticos"
	elif numero==4:
		RepuestaUser="Innatistas"
	elif numero==5:
		RepuestaUser="Francis Bacon"
	elif numero==6:
		RepuestaUser="Epistemología"
	elif numero==7:
		RepuestaUser="Hipatía"
	ValiarEleccion()

func ValiarEleccion():
	if RepuestaUser==RespuestaCorrecta:
		repondioPLayerBien=true
		puntoPLayer+=1
		
		$"../Informacion/Inforound".text="Corecto!"
		$"../Informacion/Segundos".text=" "
		$"../Informacion/Round".text=" "
		$"../Questions".hide()
		$"../Informacion".show()
		get_tree().paused = true
		
		if elecionPLayer=="Empirista":
			$"../player".enviarataqueRojo()
			$AnimatedSprite2D.play("deathracio")
		elif elecionPLayer=="Racionalista":
			$"../player".enviarataqueblanco()
			$AnimatedSprite2D.play("death")
		$"../CharacterBody2D".hide()
		
		await get_tree().create_timer(2).timeout
		$"../CharacterBody2D".show()
		get_tree().paused = false
		$"../Informacion/Inforound".text="Round"
		$"../Informacion/Round".text= str(Round)
		countdown_timer=3
		
	else:
		repondioPLayerBien=false
		puntosEnemy+=1
		$"../Informacion/Inforound".text="Incorrecto!"
		$"../Informacion/Segundos".text=" "
		$"../Informacion/Round".text=" "
		$"../Questions".hide()
		$"../Informacion".show()
		get_tree().paused = true
		
		if elecionPLayer=="Empirista":
			$"../player".murioempi()
			$AnimatedSprite2D.play("ataqueracio")
		elif elecionPLayer=="Racionalista":
			$"../player".murio()
			$AnimatedSprite2D.play("ataque")
		$"../CharacterBody2D".hide()
		
		await get_tree().create_timer(2).timeout
		$"../CharacterBody2D".show()
		get_tree().paused = false
		$"../Informacion/Inforound".text="Round"
		$"../Informacion/Round".text= str(Round)
		countdown_timer=3
	$"../Questions".hide()
	$"../Informacion".show()
	if Round==4 && RoundsEnemy>RoundsPlayer && puntosEnemy==2|| Round==4 && RoundsPlayer>RoundsEnemy && puntoPLayer==2 || Round==5 && RoundsEnemy>RoundsPlayer && puntosEnemy==2|| Round==5 && RoundsPlayer>RoundsEnemy && puntoPLayer==2:
			siguienteRound()
	else:
		reiniciar()

func reiniciar():
	if celebrar==false:
		$"../DirectionalLight2D".show()
		estadoCorrer=false
		if correctplayer=="Empirista":
			$AnimatedSprite2D.play("idle")
		elif correctplayer=="Racionalista":
			$AnimatedSprite2D.play("idleracio")
		$".".position= Vector2(1122,601)
		$"../player".position= Vector2(26,568.499)
		$"../StaticBody2D/CollisionStopPlayer".position=Vector2(80,505)
		$"../CharacterBody2D".position=Vector2(530,90)
		Gano="Nadie"
		countdown_timer=3
		estadoCorrer=false
		RepuestaUser=" "
		RespuestaCorrecta=" "
		Gano="Nadie"
		Respondio=false 
		RespondioEnemy=false
		win ="Nadie"
		countdown_timer=3
		ManagerGame()
		Respondio=false
		RespondioEnemy=false
		siguienteRound()

func siguienteRound():
	print("Enemy puntos:")
	print(RoundsEnemy)
	print("Player puntos:")
	print(RoundsPlayer)
	if Round==4 && RoundsEnemy>RoundsPlayer && puntosEnemy==2|| Round==4 && RoundsPlayer>RoundsEnemy && puntoPLayer==2 ||Round==5 || Round==6:
		if RoundsPlayer>RoundsEnemy:
			print("ganastes")
			$"../Informacion/Inforound".text="Ganastes!"
			win="Tu"
			celebrar=true
			$"../Informacion/Round".text=" "
			$"../Informacion/Segundos".text=" "
			$"../Informacion/Label".text=" "
			$"../Informacion/Label2".text= " "
			$"../Informacion/EnemyPuntos2".text=" "
			$"../Informacion/PlayerPuntos".text=" "
			$"../CharacterBody2D".hide()
			if elecionPLayer=="Racionalista":
				celebrar=true
				$AnimatedSprite2D.play("perdioRacio")
				print("ajajjajajajjajajjajajjajajajjaja")
				$"../player".ganoEmpi()
				#get_tree().paused = true
				$"../Racionalista".play()
				print("a w 1")
				await get_tree().create_timer(5).timeout
				print("W 1")
			elif elecionPLayer=="Empirista":
				print("jejejjejejejje")
				celebrar=true
				$AnimatedSprite2D.play("perdioEmpi")
				$"../player".ganoRacio()
				#get_tree().paused = true
				$"../Empirista".play()
				print("a w 2")
				
				await get_tree().create_timer(5).timeout
				print("W 2")
			$"../Back".show()
			await get_tree().create_timer(30).timeout
			
			
			SPEED=0
			$"../Informacion/Segundos".hide()
			$"../Informacion/Round".hide()
		if RoundsEnemy>RoundsPlayer:
			$"../Informacion/Inforound".text="Perdiste!"
			win="Enemigo"
			$"../Informacion/Round".text=" "
			$"../Informacion/Segundos".text=" "
			$"../Informacion/Label".text=" "
			$"../Informacion/Label2".text= " "
			$"../Informacion/EnemyPuntos2".text=" "
			$"../Informacion/PlayerPuntos".text=" "
			celebrar=true
			$"../CharacterBody2D".hide()
			if elecionPLayer=="Racionalista":
				print("a p 1")
				celebrar=true
				$AnimatedSprite2D.play("winRacio")
				$"../player".perdioRacio()
				#get_tree().paused = true
				$"../Back".show()
				$"../Racionalista".play()
				await get_tree().create_timer(5).timeout
				print("p 1")
			elif elecionPLayer=="Empirista":
				print("a p 2")
				celebrar=true
				$AnimatedSprite2D.play("winEmpi")
				$"../player".perdioempi()
				$"../Back".show()
				#get_tree().paused = true
				$"../Racionalista".play()
				$"../Informacion/Segundos".hide()
				$"../Informacion/Round".hide()
				await get_tree().create_timer(5).timeout
				print("p 2 ")
			
			SPEED=0
			$"../Informacion/Segundos".hide()
			$"../Informacion/Round".hide()
			
			Gano="sepa"
			#await get_tree().create_timer(30).timeout
			estadoCorrer=false
			$"../Informacion/Timer".stop()
	
	if puntoPLayer>=2:
		RoundsPlayer+=1
		puntoPLayer=0
		puntosEnemy=0
		Round+=1
		$"../DirectionalLight2D".show()
		if Round==1:
			$"../PosicionSprite1".show()
			if elecionPLayer=="Empirista":
				$"../PosicionSprite1".play("PocionRoja")
			elif elecionPLayer=="Racionalista":
				$"../PosicionSprite1".play("PocionBlanca")
		elif Round==2:
			$"../PosicionSprite2".show()
			if elecionPLayer=="Empirista":
				$"../PosicionSprite2".play("PocionRoja")
			elif elecionPLayer=="Racionalista":
				$"../PosicionSprite2".play("PocionBlanca")
		elif Round==3:
			$"../PosicionSprite3".show()
			if elecionPLayer=="Empirista":
				$"../PosicionSprite3".play("PocionRoja")
			elif elecionPLayer=="Racionalista":
				$"../PosicionSprite3".play("PocionBlanca")
		
		if Round==4:
			$"../PosicionSprite4".show()
			if elecionPLayer=="Empirista":
				$"../PosicionSprite4".play("PocionRoja")
			elif elecionPLayer=="Racionalista":
				$"../PosicionSprite4".play("PocionBlanca")
		
		if Round==5:
			$"../PosicionSprite5".show()
			if elecionPLayer=="Empirista":
				$"../PosicionSprite5".play("PocionRoja")
			elif elecionPLayer=="Racionalista":
				$"../PosicionSprite5".play("PocionBlanca")
		
	elif puntosEnemy>=2:
		RoundsEnemy+=1
		puntoPLayer=0
		puntosEnemy=0
		Round+=1
		$"../DirectionalLight2D".show()
		if Round==1:
			$"../PosicionSprite1".show()
			if correctplayer=="Empirista":
				$"../PosicionSprite1".play("PocionRoja")
			elif correctplayer=="Racionalista":
				$"../PosicionSprite1".play("PocionBlanca")
		elif Round==2:
			$"../PosicionSprite2".show()
			if correctplayer=="Empirista":
				$"../PosicionSprite2".play("PocionRoja")
			elif correctplayer=="Racionalista":
				$"../PosicionSprite2".play("PocionBlanca")
		elif Round==3:
			$"../PosicionSprite3".show()
			if correctplayer=="Empirista":
				$"../PosicionSprite3".play("PocionRoja")
			elif correctplayer=="Racionalista":
				$"../PosicionSprite3".play("PocionBlanca")
		if Round==4:
			$"../PosicionSprite4".show()
			if correctplayer=="Empirista":
				$"../PosicionSprite4".play("PocionRoja")
			elif correctplayer=="Racionalista":
				$"../PosicionSprite4".play("PocionBlanca")
		if Round==5:
			$"../PosicionSprite5".show()
			if correctplayer=="Empirista":
				$"../PosicionSprite5".play("PocionRoja")
			elif correctplayer=="Racionalista":
				$"../PosicionSprite5".play("PocionBlanca")
	
			

#if correctplayer=="Empirista":
#	elif correctplayer=="Racionalista":
func Fin():
	if win=="Tu":
		if elecionPLayer=="Racionalista":
			$AnimatedSprite2D.play("perdioRacio")
			$"../player".fatalitiempi()
		#$"../Racionalista".play()
		elif elecionPLayer=="Empirista":
			$AnimatedSprite2D.play("perdioEmpi")
			$"../player".fatalitiRacio()
	elif win=="Enmigo":
		if elecionPLayer=="Racionalista":
			$AnimatedSprite2D.play("winRacio")
			$"../player".perdioRacio()
		#$"../Racionalista".play()
			print("p 1")
		elif elecionPLayer=="Empirista":
			$AnimatedSprite2D.play("winEmpi")
			$"../player".perdioempi()
	await get_tree().create_timer(2).timeout

func _on_salir_pressed():
	get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel="mundo"
	get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	get_tree().get_nodes_in_group("WarGame")[0].queue_free()
