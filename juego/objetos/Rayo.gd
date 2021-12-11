extends Area2D

export var velocidad_caida = 400.0
var mi_pos = Vector2.ZERO
onready var animacion = $AnimatedSprite




func _ready():
	global_position = mi_pos
	animacion.play("caer")


func _process(delta):
	global_position.y += velocidad_caida * delta


# Crea el rayo cuando es instanciado en la posicion que se le pasa como parametro
func crear(pos):
	mi_pos = pos


#metodo conectado --> si el rayo desaparece de la pantalla, se destruye
func _on_VisibilityNotifier2D_screen_exited():
	destruirse()


func _on_body_entered(body):
	if body.is_in_group("jugador"):
		body.respawn()
	destruirse()



func destruirse():
	queue_free()
