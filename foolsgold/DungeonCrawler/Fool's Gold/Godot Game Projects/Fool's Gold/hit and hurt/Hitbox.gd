extends Area2D

var knockback_vector = Vector2.ZERO




func _on_Hurtbox_area_entered(_area):
	queue_free()


func _on_Spider_barrel_heart_mode():
	queue_free()


func _on_Spider_barrel_dead():
	queue_free()
