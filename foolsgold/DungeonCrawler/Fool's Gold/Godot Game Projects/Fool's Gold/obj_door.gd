extends StaticBody2D


var value = null


onready var sprite = $Sprite





func _on_Area2D_body_entered(body):
	if body.name == "obj_player" && body.get("Key") > 0:
		body.Key -= 1
		$Sprite.play("open")
		value = get_tree().change_scene("res://Home Screen/HomeScreen.tscn")
		return value
