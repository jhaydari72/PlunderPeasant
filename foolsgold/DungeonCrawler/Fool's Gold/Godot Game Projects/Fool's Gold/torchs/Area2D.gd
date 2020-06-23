extends Area2D


signal turned_on
onready var sprite = $AnimatedSprite


func _on_Area2D_body_entered(body):
	if body.name == "obj_player" and Input.is_action_just_pressed("ui_enter"):
		sprite.play("on")
		emit_signal("turned_on")
