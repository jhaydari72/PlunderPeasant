extends Area2D

var knockback_vector = Vector2.ZERO

func _on_Hurtbox_area_entered(_area):
	queue_free()
