extends Control

export var escena = ""

func _ready():
	DatosPlayer.reset()


func _on_BotonIniciar_pressed():
	MusicaGlobal.replay()
	get_tree().change_scene(escena)
