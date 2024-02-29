extends CharacterBody2D

#rango 260-350 
var SPEED = randi_range(180,320)
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
# Get the gravity from the project settings to be synced with RigidBody nodes.d
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	#print(SPEED)
	if position.y < 600:
		position.y += 5
	if estadoCorrer==true:
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
		move_and_slide()
	_Correrstop()
	$"../Informacion/Round".text= str(Round)
	$"../Informacion/PlayerPuntos".text = str(puntoPLayer)
	$"../Informacion/EnemyPuntos2".text = str(puntosEnemy)
	if Gano=="Player"||Gano=="Enemy" && Respondio==false:
		ManagerGame()
	#ManagerGame()

func _on_area_2d_area_entered(area):
	pass
	#print(str(area))
	#print("Entro el enemigo en player,skeletron")
	#ED)
	
func _ready():
	Intruciones()
	ManagerGame()
	pass

func Intruciones():
	$"../Informacion".hide()
	$"../InfoStart".show()
	get_tree().paused = true
	await get_tree().create_timer(30).timeout
	get_tree().paused = false
	$"../InfoStart".hide()
	$"../Informacion".show()

func ManagerGame():
	if position.y < 600:
		position.y += 5
	if estadoCorrer==true:
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
		move_and_slide()
	else:
		$AnimatedSprite2D.play("idle")
	_Correrstop()
	
	if Round==1 || Round==2 || Round==3 || Round==4|| Round==5:
		if Gano=="Nadie":
			$"../Informacion/Timer".start()
			_on_timer_timeout()
		elif Gano=="Player" && Respondio==false:
			QuestionDo()
			$"../Informacion".hide()
			$"../Questions".show()
			Respondio=true
		elif Gano=="Enemy" && RespondioEnemy==false:
			$AnimatedSprite2D.play("idle")
			$"../Informacion/Inforound".text="Eligiendo..."
			$"../Informacion/Segundos".text=" "
			$"../Informacion/Round".text=" "
			get_tree().paused = true
			await get_tree().create_timer(3).timeout
			
			if Elecionenemy==true:
				$"../Informacion/Inforound".text="Enemy acerto"
				print("Repondio bien")
			elif Elecionenemy==false:
				$"../Informacion/Inforound".text="Enemy se equivoco"
				print ("Respondio mal")
			await get_tree().create_timer(2).timeout
			
			get_tree().paused = false
			$"../Informacion/Inforound".text="Round"
			$"../Informacion/Round".text= str(Round)
			countdown_timer=3
			EleccionEnemy()
			
			RespondioEnemy=true
			reiniciar()
		

func _on_timer_timeout():
	if countdown_timer > 0:
		$"../Informacion/Segundos".text = str(countdown_timer)
		countdown_timer -= 1
	else:
		$"../Informacion/Segundos".text = "¡Ya!"
		$"../Informacion/Timer".stop()
		estadoCorrer=true
		$"../StaticBody2D/CollisionStopPlayer".position=Vector2(5000,5000)
func _Correrstop():
	if position.x<613:
		estadoCorrer=false
		$AnimatedSprite2D.play("idle")

func QuestionDo():
	numero = randi() % 7
	print(numero)
	if numero==0:
		$"../Questions/DoQuestion".text="Para algunos de los siguientes filósofos, el criterio de verdad es la evidencia sensible:
A) Empiristas. B) Criticistas. C) Racionalistas. D) Dogmáticos"
		RespuestaCorrecta="Empiristas"
	elif numero==1:
		$"../Questions/DoQuestion".text="De las siguientes, una de ellas es la corriente filosófica que en general tiende a negar la
posibilidad de la metafísica y a sostener que hay conocimiento únicamente de los fenómenos"
		RespuestaCorrecta="Empiristas"
	elif numero==2:
		$"../Questions/DoQuestion".text="Para unos de los siguientes filósofos, la experiencia como única fuente del conocimiento.
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
		$"../Questions/DoQuestion".text="De los siguientes filósofos selecciones el que no se considera Racionalista:
A) David Hume. B) John Locke. C) Nicolas Malebranch. D) Francis Bacon"
		RespuestaCorrecta="Nicolas Malebranch"
	elif numero==6:
		$"../Questions/DoQuestion".text="Es la doctrina que establece que todos nuestros conocimientos provienen de la razón.
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
	var posibility= randi() % 9
	print(posibility)
	if posibility<4:
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
		await get_tree().create_timer(2).timeout
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
		await get_tree().create_timer(2).timeout
		get_tree().paused = false
		$"../Informacion/Inforound".text="Round"
		$"../Informacion/Round".text= str(Round)
		countdown_timer=3
	$"../Questions".hide()
	$"../Informacion".show()
	reiniciar()

func reiniciar():
	estadoCorrer=false
	$AnimatedSprite2D.play("idle")
	$".".position= Vector2(1122,601)
	$"../player".position= Vector2(26,568.499)
	$"../StaticBody2D/CollisionStopPlayer".position=Vector2(80,505)
	$"../CharacterBody2D".position=Vector2(530,90)
	Gano="Nadie"
	countdown_timer=3
	ManagerGame()
	Respondio=false
	RespondioEnemy=false
	siguienteRound()

func siguienteRound():
	if puntoPLayer>=2:
		RoundsPlayer+=1
		puntoPLayer=0
		puntosEnemy=0
		Round+=1
	elif puntosEnemy>=2:
		RoundsEnemy+=1
		puntoPLayer=0
		puntosEnemy=0
		Round+=1
	if Round==5 || Round==6:
		if RoundsPlayer>RoundsEnemy:
			print("ganastes")
			$"../Informacion/Inforound".text="Ganastes!"
			$"../Informacion/Round".text=" "
			$"../Informacion/Segundos".text=" "
			$"../Informacion/Label".text=" "
			$"../Informacion/Label2".text= " "
			$"../Informacion/EnemyPuntos2".text=" "
			$"../Informacion/PlayerPuntos".text=" "
			get_tree().paused = true
		if RoundsEnemy>RoundsPlayer:
			$"../Informacion/Inforound".text="Perdistes!"
			$"../Informacion/Round".text=" "
			$"../Informacion/Segundos".text=" "
			$"../Informacion/Label".text=" "
			$"../Informacion/Label2".text= " "
			$"../Informacion/EnemyPuntos2".text=" "
			$"../Informacion/PlayerPuntos".text=" "
			get_tree().paused = true
