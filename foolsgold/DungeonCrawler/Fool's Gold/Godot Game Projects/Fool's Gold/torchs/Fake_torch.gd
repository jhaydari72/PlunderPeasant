extends StaticBody2D


onready var sprite = $AnimatedSprite
onready var light = $Light2D

	



func _input(event):
	if Input.is_action_just_pressed("ui_enter"):
		sprite.play("on")
		light.show()
