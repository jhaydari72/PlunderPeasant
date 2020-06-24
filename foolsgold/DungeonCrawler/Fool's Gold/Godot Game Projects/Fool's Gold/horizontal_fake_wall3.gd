extends StaticBody2D

onready var timer = $Timer

func _on_fake_torch6_light_on6():
	$AnimatedSprite.play("open")
	timer.start()
