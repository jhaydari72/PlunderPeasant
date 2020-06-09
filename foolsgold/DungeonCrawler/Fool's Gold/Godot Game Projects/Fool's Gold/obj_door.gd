extends StaticBody2D

onready var sprite = $Sprite





func _on_Area2D_body_entered(body):
	if body.name == "obj_player" && body.get("Key") > 0:
		body.Key -= 1
		$Sprite.play("open")
