extends Area2D

signal keycollected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Key_body_entered(body):
	if body.name == "obj_player": 
		$AnimationPlayer.play("Key Bounce")
		
		$Timer.start()	

func _on_Timer_timeout():
	emit_signal("keycollected")
	queue_free()


#Key


 # Replace with function body.
