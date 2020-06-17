extends StaticBody2D

onready var light = $torch_light
onready var area = $Area2D
onready var sprite = $Sprite




func _on_Area2D_area_entered(_area):
	$torch_light.show()
	$Sprite.play("on")
