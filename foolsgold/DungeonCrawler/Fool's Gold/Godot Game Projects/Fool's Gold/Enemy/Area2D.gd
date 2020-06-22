extends Area2D

signal health_up

func _on_Area2D_body_entered(body):
	if body.name == "obj_player":
		emit_signal("health_up")


func _on_Spider_barrel_dead():
	queue_free()
