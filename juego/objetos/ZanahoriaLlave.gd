extends Area2D
signal consumido()


func _on_body_entered(_body):
	DatosPlayer.restar_llaves()
	emit_signal("consumido")
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("consumir")
