extends Area2D

signal heartCount

func _ready():
	pass 
	
	


func _on_Heart_body_entered(body):
	if body.name == "obj_player": 
		$AnimationPlayer.play("Heart Bounce")
		
		$Timer.start()


func _on_Timer_timeout():
	emit_signal("heartCount")
	queue_free()


func _on_Heart_heartCount():
	pass # Replace with function body.
