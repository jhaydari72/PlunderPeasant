extends StaticBody2D


signal light_on2


onready var sprite = $AnimatedSprite
onready var light = $Light2D


func _input(_event):
	if Input.is_action_just_pressed("ui_enter"):
		var bodies = $Area2D.get_overlapping_bodies()
		for b in bodies:
			if b.name == "obj_player":
				light.show()
				sprite.play("on")
				emit_signal("light_on2")
