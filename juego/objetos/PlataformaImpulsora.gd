extends Area2D

onready var animacion = $AnimationPlayer
onready var audioSalto = $AudioSalto


func _ready():
	animacion.play("idle")


func _on_DetectorImpulso_body_entered(body):
	audioSalto.play()
	animacion.play("impulsar")
	body.impulsar()
