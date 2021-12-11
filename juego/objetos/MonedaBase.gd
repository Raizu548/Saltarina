extends Area2D

export(String, "oro", "plata", "bronce") var tipo_moneda

onready var animacion_sprite = $AnimatedSprite
onready var animacion = $AnimationPlayer 
onready var colision_personaje = $ColisionPersonaje

func _ready():
	animacion_sprite.play()


func _on_body_entered(_body):
	DatosPlayer.sumar_monedas(tipo_moneda)
	colision_personaje.set_deferred("disabled", true) # se desactiva para que no cuente 2 veces la misma moneda
	animacion.play("consumir")
