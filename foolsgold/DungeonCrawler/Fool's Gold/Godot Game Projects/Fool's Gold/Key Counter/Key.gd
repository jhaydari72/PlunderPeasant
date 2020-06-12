extends Area2D


	


func _on_Key_body_entered(body):
	if body.name == "obj_player" && body.get("Key") < 9:
		body.Key += 1
		queue_free()
