extends Node


@onready var Player = $Player
var scoreJugador :=0

func _ready():
	$JuegoSonido.play()
	Player.connect("scoreUp",subirScore)
	Player.connect("playedDied",morir)

func subirScore():
	scoreJugador+=1
	$ScoreLabel.text = str(scoreJugador)

func morir():
	$DeathScreen/HBoxContainer/FinalScore.text = str(scoreJugador)
	$DeathScreen.show()

func _on_player_played_died():
	$DeathScreen/HBoxContainer/FinalScore.text = str(scoreJugador)
	$DeathScreen.show()
	get_tree().paused = true 


func _on_player_score_up():
	scoreJugador+=3
	$ScoreLabel.text = str(scoreJugador)


func _on_salir_button_2_pressed():
	get_tree().quit()
	#get_tree().get_nodes_in_group("GAME")[0].siguiente_nivel = "royal"
	#get_tree().get_nodes_in_group("GAME")[0]._verficar_nivel()
	#get_tree().get_nodes_in_group("MiniRecolector")[0].queue_free()
