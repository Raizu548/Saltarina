extends Control

export var menu_principal = ""

func _ready():
	visible = false

# si la tecla de evento presiona es "pausa", hace esta metodo 
func _input(event):
	if event.is_action_pressed("pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused


func _on_BotonContinuar_pressed():
	visible = not visible
	get_tree().paused = false


func _on_BotonMenuPrincipal_pressed():
	get_tree().paused = false
	get_tree().change_scene(menu_principal)
