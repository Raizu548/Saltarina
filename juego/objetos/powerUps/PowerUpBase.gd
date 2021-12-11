extends Area2D
#Esta es una clase padre, los hijos van a heredar el metodo aplicar_power_up

onready var animacion = $AnimationPlayer
onready var detector_personaje = $CollisionShape2D


func _on_body_entered(body):
	aplicar_power_up(body)
	detector_personaje.set_deferred("disabled", true)
	animacion.play("consumir")


func aplicar_power_up(body):
	pass
