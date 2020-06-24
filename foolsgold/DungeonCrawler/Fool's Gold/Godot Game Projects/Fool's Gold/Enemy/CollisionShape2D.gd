extends CollisionShape2D



onready var time = $Timer2


func _on_Spider_barrel_heart_mode():
	queue_free()








func _on_Spider_barrel_dead():
	$Timer2.start()
	


func _on_Timer2_timeout():
	queue_free()
