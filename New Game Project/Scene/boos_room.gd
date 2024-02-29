extends Node2D

var countdown_timer = 3
func _ready():
	.start()

func _on_timer_timeout():
	if countdown_timer > 0:
		$"../Informacion/Segundos".text = str(countdown_timer)
		countdown_timer -= 1
	else:
		$"../Informacion/Segundos".text = "¡Ya!"
		$"../Informacion/Timer".stop()
