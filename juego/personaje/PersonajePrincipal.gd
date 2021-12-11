extends KinematicBody2D

export var velocidad = Vector2(150.0, 150.0) #velocidad en la que se mueve el personaje
export var acel_caida = 400 
export var fuerza_salto = 3000 #fuerza con la que salta el personaje
export var fuerza_rebote = 350
export var impulso = -4000
export var aceleracion_caida_powerUp = 60

var movimiento = Vector2.ZERO
var fuerza_salto_original
var acel_caida_original 
var puede_moverse = true


onready var animacion = $AnimatedSprite
onready var audio_salto = $AudioSalto
onready var camara = $Camera2D
onready var enfriamiento_power_up = $EnfriamientoPowerUpSalto
onready var enfriamiento_volar = $EnfriamientoPowerUpVolar
onready var animacion_player= $AnimationPlayer


func _ready():
	animacion_player.play("aclarar")
	# se resguarda los valores originales.
	fuerza_salto_original = fuerza_salto
	acel_caida_original = acel_caida


func _physics_process(_delta):
	movimiento.x = velocidad.x * tomar_direccion()
	
	caer()
	saltar()
	colision_techo()
	caida_al_vacio()
	
# warning-ignore:return_value_discarded
	move_and_slide(movimiento, Vector2.UP) #vector up indica que el suelo mira hacia arriba	



# Toma la fuerza de las direcciones para mover al personaje
func tomar_direccion():
	var direccion = 0
	if puede_moverse:
		direccion = Input.get_action_strength("mov_derecha") - Input.get_action_strength("mov_izquierda")
		if direccion == 0:
			animacion.play("idle")
		else:
			if direccion < 0:
				animacion.flip_h = true
			else:
				animacion.flip_h = false	
			animacion.play("correr")
	
	return direccion



func caer():
	if not is_on_floor():
		animacion.play("saltar")
		movimiento.y += acel_caida
		movimiento.y = clamp(movimiento.y, impulso, velocidad.y)



func saltar():
	if Input.is_action_just_pressed("salto") and is_on_floor() and puede_moverse:
		animacion.play("saltar")
		audio_salto.play()
		saltar_movimiento()

# metodo que impulsa al personaje hacia arriba
func saltar_movimiento():
	movimiento.y = 0
	movimiento.y -= fuerza_salto


func impulsar():
	movimiento.y = impulso


# ---------------- METODOS USADOS POR POWER UP -------------
# modifica la fuerza de salto del personaje
func cambiar_fuerza_salto():
	enfriamiento_power_up.start()
	fuerza_salto = -impulso * 0.9

#Permite volar al jugador
func volar():
	enfriamiento_volar.start()
	acel_caida = aceleracion_caida_powerUp
	animacion_player.play("volar")
	saltar_movimiento()



#Permite que el personaje no quede flotando cuando choca un techo
func colision_techo():
	if is_on_ceiling():
		movimiento.y = fuerza_rebote


# si posicion es mayor al limite bajo de la camara, respawnea el jugador
func caida_al_vacio():
	if position.y > camara.limit_bottom:
		respawn()

# resetea la partida
func respawn():
	DatosPlayer.restar_vidas()
	animacion_player.play("oscurecer")
	if DatosPlayer.get_vida() >= 1:
# warning-ignore:return_value_discarded
		DatosPlayer.cant_monedas_al_pasar_nivel()
		get_tree().reload_current_scene()


func play_entrar_portal(posicion_portal):
	puede_moverse = false
	animacion_player.play("entrar_portal")
	$Tween.interpolate_property(
		self, #objeto a interactuar
		"global_position", # propiedad que va a ser afectada
		global_position, # posicion inicial
		posicion_portal, #posicion final
		0.8, # tiempo
		Tween.TRANS_LINEAR, #como se mueve
		Tween.EASE_IN_OUT # tipo de interpolacion
	)
	$Tween.start()



# --- METODOS DE TIEMPOS --- 
func _on_EnfriamientoPowerUp_timeout():
	fuerza_salto = fuerza_salto_original

func _on_EnfriamientoPowerUpVolar_timeout():
	animacion_player.play("idle")
	acel_caida = acel_caida_original


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "entrar_portal":
		animacion_player.play("oscurecer")
