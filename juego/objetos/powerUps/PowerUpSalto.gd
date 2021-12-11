extends "res://juego/objetos/powerUps/PowerUpBase.gd"

# Sobre escribe el metodo del padre
func aplicar_power_up(body):
	body.cambiar_fuerza_salto()
