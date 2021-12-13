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

#puntuacion de cada moneda
var punto_oro = 10
var punto_plata = 5
var punto_bronce = 2

#moneda guardad cuando pasas de nivel
var monedas_oro_despues_escenario = 0
var monedas_plata_despues_escenario = 0
var monedas_bronce_despues_escenario = 0

func reset():
	vida = 3
	monedas_oro = 0
	monedas_plata = 0
	monedas_bronce = 0
	monedas_oro_despues_escenario = 0
	monedas_plata_despues_escenario = 0
	monedas_bronce_despues_escenario = 0


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


# al morir pierdes las monedas conseguidas en el nuevo nivel
func cant_monedas_al_pasar_nivel():
	monedas_bronce = monedas_bronce_despues_escenario
	monedas_oro = monedas_oro_despues_escenario
	monedas_plata = monedas_plata_despues_escenario

# al pasar al siguiente nivel empiezas con la cantidad de monedas que empezste,
func actualizar_cant_monedas_nivel():
	monedas_bronce_despues_escenario = monedas_bronce
	monedas_oro_despues_escenario = monedas_oro
	monedas_plata_despues_escenario = monedas_plata


func generar_puntaje():
	puntaje = puntaje_tot_bronce() + puntaje_tot_oro() + puntaje_tot_plata()
	return puntaje 


func puntaje_tot_oro():
	return monedas_oro * punto_oro

func puntaje_tot_bronce():
	return monedas_bronce * punto_bronce

func puntaje_tot_plata():
	return monedas_plata * punto_plata

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

func get_punto_oro():
	return punto_oro	

func get_punto_bronce():
	return punto_bronce

func get_punto_plata():
	return punto_plata
