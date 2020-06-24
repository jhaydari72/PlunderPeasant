extends StaticBody2D


signal light_on2


onready var sprite = $AnimatedSprite
onready var light = $Light2D





func _on_Area2D_area_entered(_area):
	sprite.play("on")
	light.show()
	emit_signal("light_on2")
	print("hello")
