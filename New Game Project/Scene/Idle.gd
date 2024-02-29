extends State
@onready var collision=  $"../../PlayerDetection"
@onready var progress_bar = owner.find_child("ProgressBar")

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled",value)
		progress_bar.set_deferred("visible",value)
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func transition():
	if player_entered:
		get_parent().change_state("Follow")


func _on_player_detection_body_entered(body):
	player_entered=true
	print("Entro")


func _on_player_detection_area_entered(area):
	player_entered=true
	print("Entro")
