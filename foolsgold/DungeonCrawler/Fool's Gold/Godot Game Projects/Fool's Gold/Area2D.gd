extends Area2D

var player = null


func can_see_player():
	return player != null


func _on_Hurtbox_area_entered(_area):
	queue_free()


func _on_Area2D_body_entered(body):
	player = body


func _on_Area2D_body_exited(_body):
	player = null


func _on_Spider_barrel_heart_mode():
	queue_free()
