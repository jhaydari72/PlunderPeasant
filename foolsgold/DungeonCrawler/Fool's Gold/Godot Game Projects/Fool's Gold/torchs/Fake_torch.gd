extends StaticBody2D

signal light_on



onready var sprite = $AnimatedSprite
onready var light = $Light2D

	



func _input(_event):
	if Input.is_action_just_pressed("ui_enter"):
		sprite.play("on")
		light.show()
		emit_signal("light_on")
