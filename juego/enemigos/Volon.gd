extends Area2D

onready var detector_jugador = $DetectorJugador
onready var detector_pisoton = $DetectorPisoton/Colisionador
onready var animacion = $AnimationPlayer


# Ejecuta el metodo impulsar si pisa la cabeza de Volon
func _on_DetectorPisoton_body_entered(body):
	desactivar_colisionadores([detector_jugador, detector_pisoton])
	animacion.stop() # detiene la animacion que se este ejecutando en ese momento.
	animacion.play("morir")
	body.impulsar()



func _on_body_entered(body):
	body.respawn()


# se le pasa una lista de los colisionadores a desactivar
func desactivar_colisionadores(colisionadores):
	for colision in colisionadores:
		colision.set_deferred("disabled", true)
		colision.set_deferred("visible", false)
