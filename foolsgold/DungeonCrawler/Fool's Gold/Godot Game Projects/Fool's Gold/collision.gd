extends CollisionShape2D


onready var timer = $Timer2






func _on_Timer_timeout():
	queue_free()


func _on_Hurtbox_area_entered(_area):
	timer.start()
