extends Node
signal actualizar_datos()
signal game_over()

var vida = 3
var monedas_oro = 0
var monedas_plata = 0
var monedas_bronce = 0
var llaves = 0
var nivel_actual = ""
var puntaje = 0

var punto_oro = 10
var punto_plata = 5
var punto_bronce = 2


func reset():
	vida = 3
	monedas_oro = 0
	monedas_plata = 0
	monedas_bronce = 0


func restar_vidas():
	vida -= 1
	if vida == 0:
		emit_signal("game_over")
	emit_signal("actualizar_datos")

func restar_llaves():
	llaves -= 1
	emit_signal("actualizar_datos")


func contabilizar_llaves(valor):
	llaves = valor
	emit_signal("actualizar_datos")


func sumar_monedas(moneda):
	match moneda:
		"bronce":
			monedas_bronce += 1
		"plata":
			monedas_plata += 1
		"oro":
			monedas_oro += 1
		_:
			print("ERROR")
	
	emit_signal("actualizar_datos")

func generar_puntaje():
	puntaje = monedas_oro * punto_oro + monedas_plata * punto_plata + monedas_bronce * punto_bronce
	return puntaje 


func get_vida():
	return vida
	
func get_moneda_oro():
	return monedas_oro
	
func get_moneda_plata():
	return monedas_plata

func get_moneda_bronce():
	return monedas_bronce

func get_llaves():
	return llaves

func get_nivel_actual():
	return nivel_actual
	
func set_nivel_actual(nuevo_nivel):
	nivel_actual = nuevo_nivel
