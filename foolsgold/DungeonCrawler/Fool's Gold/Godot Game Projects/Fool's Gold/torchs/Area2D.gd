extends Area2D





onready var sprite = $AnimatedSprite
onready var light = $Light2D




func _on_Fake_torch_area_entered(area):
	sprite.play("on")
	light.show()
