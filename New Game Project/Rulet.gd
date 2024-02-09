extends Node2D

var playedFrames = [] 
# Called when the node enters the scene tree for the first time.
func playing():
	$AnimationPlayer.play("Role")
	await get_tree().create_timer(3).timeout
	roling()
	
func _process(delta):
	#if Input.is_action_just_pressed("interact"):
		#$AnimationPlayer.play("Role")
		#await get_tree().create_timer(3).timeout
		#roling()
		pass
	
func roling():
	while ($AnimationPlayer.is_playing()):
		await get_tree().create_timer(1).timeout 
		var current_frame = $Sprite2D.get_frame()
		if (current_frame not in playedFrames): 
			playedFrames.append(current_frame) 
			if (current_frame == 0 and not Main.BlueGame):
				print("Minijuego Politica")
				print("Blue")
				Main.BlueGame = true
				$AnimationPlayer.pause()
				Main.rulet=true
				break  
			elif (current_frame == 1 and not Main.pinkGame):
				print("Minijuego Ciencia")
				print("Pink")
				Main.pinkGame = true
				$AnimationPlayer.pause()
				break  
			elif (current_frame == 2 and not Main.yellowGame):
				print("Minijuego Ciencia")
				print("Yellow")
				Main.yellowGame = true
				$AnimationPlayer.pause()
				break 
			elif (current_frame == 3 and not Main.GreeGame):
				print("Minijuego Ciencia")
				print("Verde")
				Main.GreeGame = true
				Main.rulet=true
				$AnimationPlayer.pause()
				break


