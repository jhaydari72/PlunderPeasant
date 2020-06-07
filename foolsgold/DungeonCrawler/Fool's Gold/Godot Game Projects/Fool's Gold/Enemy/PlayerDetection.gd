extends Area2D

var player = null


func can_see_player():
	return player != null

func _on_PlayerDetection_body_entered(body):
	player = body


func _on_PlayerDetection_body_exited(body):
	player = null


func _on_Hurtbox_area_entered(area):
	queue_free()
