extends Control

onready var etiqueta_vidas = $ContenedorVida/Cantidad
onready var etiqueta_monedas_oro = $ContenedorMonedaDorada/Cantidad
onready var etiqueta_monedas_plata = $ContenedorMonedaPlata/Cantidad
onready var etiqueta_monedas_bronce = $ContenedorMonedaBronce/Cantidad
onready var etiqueta_llaves = $ContenedorLlaves/Cantidad


func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("actualizar_datos", self, "actualizar_hud")
	actualizar_hud()


func actualizar_hud():
	etiqueta_vidas.text = "%s" % DatosPlayer.get_vida()
	etiqueta_monedas_oro.text = "%s" % DatosPlayer.get_moneda_oro()
	etiqueta_monedas_plata.text = "%s" % DatosPlayer.get_moneda_plata()
	etiqueta_monedas_bronce.text = "%s" % DatosPlayer.get_moneda_bronce()
	etiqueta_llaves.text = "%s" % DatosPlayer.get_llaves()
