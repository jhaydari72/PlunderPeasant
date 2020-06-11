extends StaticBody2D

onready var light = $torch_light
onready var area = $Area2D
onready var sprite = $Sprite



func _input(_event):
	if Input.is_action_just_pressed("ui_enter"):
		var bodies = $Area2D.get_overlapping_bodies()
		for b in bodies:
			if b.name == "obj_player":
				$torch_light.show()
				$Sprite.play("on")
				
	
