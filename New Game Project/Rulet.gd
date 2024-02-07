extends Node2D


# Called when the node enters the scene tree for the first time.
func playing():
	$AnimationPlayer.play("Role")
	car()
	
func car():
	while ($AnimationPlayer.is_playing()):
		await get_tree().create_timer(1).timeout 
		if(!Main.GreeGame && $Sprite2D.get_frame()==0):
			print("Minijuego Politica")
			print("Blue")
			Main.GreeGame=true
			$AnimationPlayer.pause()
		elif(!Main.pinkGame && $Sprite2D.get_frame()==1):
			print("Minijuego Cincia")
			print("Pink")
			Main.pinkGame=true
			$AnimationPlayer.pause()
		elif(!Main.pinkGame && $Sprite2D.get_frame()==2):
			print("Minijuego Cincia")
			print("Yellow")
			Main.pinkGame=true
			$AnimationPlayer.pause()
		elif(!Main.GreeGame && $Sprite2D.get_frame()==3):
			print("Minijuego Cincia")
			print("Verde")
			Main.GreeGame=true
			$AnimationPlayer.pause()


