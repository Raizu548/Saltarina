extends Node2D

export var rayo: PackedScene #importa una escena

var puede_disparar = true

onready var detectar_jugador = $Sprite/RayCast2D
onready var posiciones_disparo = $Sprite/PosicionesDisparo
onready var cadencia_disparo = $Timer
onready var sfx_rayos = $Rayos

func _process(_delta):
	if detectar_jugador.is_colliding() and puede_disparar:
		disparar()
		puede_disparar = false
		cadencia_disparo.start() # recorre el tiempo para volver a disparar.


# Instancia 3 rayos recorriendo una lista de posiciones
func disparar():
	sfx_rayos.play()
	for posicion in posiciones_disparo.get_children():
		var nuevo_rayo = rayo.instance() # variable nuevo_rayo
		nuevo_rayo.crear(posicion.global_position) #accede al metodo crear de rayo
		owner.get_node("Rayos").add_child(nuevo_rayo) # en donde va ser instanciado



# espera un determinado tiempo (Time.Wait_time) para poder hacer esta funcion. 
func _on_Timer_timeout():
	puede_disparar = true
