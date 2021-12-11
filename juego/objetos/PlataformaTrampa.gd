extends StaticBody2D



func _on_DetectorPersonaje_body_entered(_body):
	$DetectorPersonaje/CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("caer")



func desabilitar_colisionador():
	$CollisionPolygon2D.set_deferred("disabled", true)
