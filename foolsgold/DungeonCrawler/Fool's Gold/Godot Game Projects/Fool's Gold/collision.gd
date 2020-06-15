extends CollisionShape2D






func _on_Hurtbox_area_entered(area):
	queue_free()
