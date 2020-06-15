extends StaticBody2D


var value = null


onready var sprite = $Sprite
onready var timer = $Timer




func _on_Area2D_body_entered(body):
	if body.name == "obj_player" && body.get("Key") > 0:
		body.Key -= 1
		$Sprite.play("open")
		timer.start()


func _on_Timer_timeout():
	value = get_tree().change_scene("res://Win Screen/Win Screen.tscn")
	return value
