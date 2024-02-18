extends Node2D

var numero=0
var respuestaCorrecta="A"
# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	numero =randi() %5
	print(numero)
	if numero==0:
		$PreguntasGame/Pregunta.text= "Durante el renacimiento, el modelo de gobierno es uno de los siguientes:
A) Monarquía absoluta. B) Tiranía republicana. C) Democracia participativa. D) Liberalismo político."
		respuestaCorrecta= "Monarquía absoluta"
	elif numero==1:
			$PreguntasGame/Pregunta.text="De los siguientes acontecimientos, selecciones el que inicia el período moderno:
A) Toma de Constantinopla. B) Tratado de paz de westfalia. C) Toma de la Bastilla. La ruta de la seda."
			respuestaCorrecta="Toma de Constantinopla"
	elif numero==2:
			$PreguntasGame/Pregunta.text="Durante el siglo XV, la sociedad se estratifica en tres estamentos definidos:
A) Clase media, baja y alta. B) nobleza, clero y estado llano. C) Artesanos, guardianes y gobernantes"
			respuestaCorrecta="nobleza, clero y estado llano"
	elif numero==3:
			$PreguntasGame/Pregunta.text="Aparece el realismo político, que se basaba en un orden establecido, explicación de un sistema y
recomendaciones de como gobernar:
A) Tomás Moro. B) Jean Bodín. C) Nicolas Maquiavelo. D) Erasmo de Rotterdam."
			respuestaCorrecta="Nicolas Maquiavelo"
	elif numero==4:
			$PreguntasGame/Pregunta.text="Terminada la edad media, en el contexto de la política resulta que:
A) La Iglesia resalta su poder. B) La Iglesia pierde el papel rector en la política. C) La Iglesia evangélica
se posiciona en la política. D) La política desaparece"
			respuestaCorrecta="La Iglesia pierde el papel rector en la política."



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
