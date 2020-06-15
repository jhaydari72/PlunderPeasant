extends CollisionShape2D




func _on_AnimatedSprite_frame_changed():
	queue_free()
