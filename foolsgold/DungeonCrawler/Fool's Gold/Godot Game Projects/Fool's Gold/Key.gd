extends Area2D

func _ready():
	connect("body_entered", self, "body_entered")

func body_entered(body):
	if body.name == "obj_player" && body.get("Key") < 9:
		body.Key += 1
		queue_free()
