extends StaticBody2D


#mOVING WALLS 
onready var timer = $Timer






func _on_fake_torch4_light_on4():
	$AnimatedSprite.play("open")
	timer.start()
