extends Area2D

var esManzana = false 
var spriteDeEnemigo = preload("res://img/Assets/spike.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if randf() >.5:
		esManzana=true
	
	
	if !esManzana:
		$Sprite.texture = spriteDeEnemigo


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if esManzana:
			body.subirScore()
		else:
			body.morirse()
		$Sprite.hide()
		$CollisionShape2D.hide()
		
func _process(delta):
	position.y +=3
