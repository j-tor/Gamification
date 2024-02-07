extends Node2D


# Called when the node enters the scene tree for the first time.
func playing():
	$AnimationPlayer.play("Role")
	roling()
	
func roling():
	while ($AnimationPlayer.is_playing()):
		await get_tree().create_timer(1).timeout 
		var current_frame = $Sprite2D.get_frame()
		if (current_frame == 0 && Main.BlueGame==false):
			print("Minijuego Politica")
			print("Blue")
			Main.BlueGame = true
			$AnimationPlayer.pause()
			Main.rulet=true
			break  
		elif (current_frame == 1 && Main.pinkGame==false):
			print("Minijuego Ciencia")
			print("Pink")
			Main.pinkGame = true
			$AnimationPlayer.pause()
			break  
		elif (current_frame == 2 && Main.yellowGame==false):
			print("Minijuego Ciencia")
			print("Yellow")
			Main.yellowGame = true
			$AnimationPlayer.pause()
			break 
		elif (current_frame == 3 && Main.GreeGame==false):
			print("Minijuego Ciencia")
			print("Verde")
			Main.GreeGame = true
			Main.rulet=true
			$AnimationPlayer.pause()
			break

